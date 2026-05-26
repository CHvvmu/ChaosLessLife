const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
// ❗ НЕ добавлять initializeApp()

exports.replanSchedule = functions.https.onCall(async (data, context) => {
  console.log("REPLAN L3 START");

  if (!context.auth) {
    throw new functions.https.HttpsError("unauthenticated", "Auth required");
  }

  const db = admin.firestore();
  const userId = context.auth.uid;
  const { scheduleId } = data;

  if (!scheduleId) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "scheduleId required",
    );
  }

  const scheduleRef = db.collection("Schedules").doc(scheduleId);

  return await db.runTransaction(async (tx) => {
    const scheduleDoc = await tx.get(scheduleRef);

    if (!scheduleDoc.exists) {
      throw new functions.https.HttpsError("not-found", "Schedule not found");
    }

    const schedule = scheduleDoc.data();

    if (schedule.userId !== userId) {
      throw new functions.https.HttpsError("permission-denied", "Not yours");
    }

    const planDate = schedule.planDate;

    // ---------------------------
    // 1. Получаем Tasks
    // ---------------------------
    const tasksSnap = await tx.get(
      db
        .collection("Tasks")
        .where("userId", "==", userId)
        .where("status", "==", "active"),
    );

    let tasks = [];

    tasksSnap.forEach((doc) => {
      const t = doc.data();

      tasks.push({
        id: doc.id,
        ...t,
      });
    });

    console.log("TASKS:", tasks.length);

    // ---------------------------
    // 2. Разделяем задачи
    // ---------------------------
    const fixedTasks = [];
    const flexibleTasks = [];

    tasks.forEach((t) => {
      if (t.manualStart || t.flexibility === 0) {
        fixedTasks.push(t);
      } else {
        flexibleTasks.push(t);
      }
    });

    // ---------------------------
    // 3. Сортировка flexible
    // ---------------------------
    const priorityScore = { high: 3, medium: 2, low: 1 };
    const energyScore = { high: 3, medium: 2, low: 1 };

    flexibleTasks.sort((a, b) => {
      return (
        (priorityScore[b.priority] || 2) - (priorityScore[a.priority] || 2) ||
        (energyScore[b.energyType] || 2) - (energyScore[a.energyType] || 2)
      );
    });

    // ---------------------------
    // 4. Очистка старых items
    // ---------------------------
    const itemsSnap = await tx.get(scheduleRef.collection("items"));

    itemsSnap.forEach((doc) => {
      tx.delete(doc.ref);
    });

    // ---------------------------
    // 5. Создаем timeline (FIXED)
    // ---------------------------

    // ✅ создаем локальное время (без сдвига +3 часа)
    const dayStart = new Date(planDate);
    dayStart.setHours(8, 0, 0, 0);

    const dayEnd = new Date(planDate);
    dayEnd.setHours(22, 0, 0, 0);

    // ✅ шаг слота (15 минут)
    const SLOT_MINUTES = 15;

    // ✅ генерация timeline
    let timeline = [];

    // DEBUG
    console.log("DAY START:", dayStart);
    console.log("DAY END:", dayEnd);
    console.log("TIMELINE SIZE:", timeline.length);

    /*    const dayStart = new Date(planDate + "T08:00:00");
    const dayEnd = new Date(planDate + "T22:00:00");

    let timeline = [];
*/
    // ---------------------------
    // 6. Добавляем fixed задачи
    // ---------------------------
    fixedTasks.forEach((t) => {
      const start = t.manualStart?.toDate
        ? t.manualStart.toDate()
        : new Date(t.manualStart || t.scheduledStart);

      const duration = t.estimatedDurationMin || 60;
      const end = new Date(start.getTime() + duration * 60000);

      timeline.push({
        start,
        end,
        task: t,
        fixed: true,
      });
    });

    // сортируем
    timeline.sort((a, b) => a.start - b.start);

    // ---------------------------
    // 7. Найти свободные слоты
    // ---------------------------
    function getFreeSlots() {
      let slots = [];

      let cursor = new Date(dayStart);

      for (const block of timeline) {
        if (cursor < block.start) {
          slots.push({
            start: new Date(cursor),
            end: new Date(block.start),
          });
        }

        cursor = new Date(Math.max(cursor, block.end));
      }

      if (cursor < dayEnd) {
        slots.push({
          start: new Date(cursor),
          end: new Date(dayEnd),
        });
      }

      return slots;
    }

    // ---------------------------
    // 8. Заполняем flexible задачи
    // ---------------------------
    flexibleTasks.forEach((task) => {
      const duration = task.estimatedDurationMin || 60;

      let slots = getFreeSlots();

      for (const slot of slots) {
        const slotDuration = (slot.end - slot.start) / 60000;

        if (slotDuration >= duration) {
          const start = new Date(slot.start);
          const end = new Date(start.getTime() + duration * 60000);

          timeline.push({
            start,
            end,
            task,
            fixed: false,
          });

          timeline.sort((a, b) => a.start - b.start);
          break;
        }
      }
    });

    // ---------------------------
    // 9. Сохраняем items
    // ---------------------------
    let index = 0;

    for (const block of timeline) {
      if (!block.task) {
        console.log("SKIP INVALID BLOCK", block);
        continue;
      }

      const itemRef = scheduleRef.collection("items").doc();

      tx.set(itemRef, {
        taskId: block.task.id,
        title: block.task.title || "",
        description: block.task.description || "",

        start: block.start,
        end: block.end,

        durationMin: block.task.estimatedDurationMin || 60,

        priority: block.task.priority || "medium",
        energyType: block.task.energyType || "medium",

        order: index,

        locked: block.fixed,
        source: block.fixed ? "manual" : "ai",

        status: "planned",

        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      index++;
    }

    // ---------------------------
    // 10. Обновляем schedule
    // ---------------------------
    tx.update(scheduleRef, {
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    console.log("REPLAN DONE:", index);

    return {
      success: true,
      items: index,
    };
  });
});

const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp()

exports.generateDailyPlan = functions
  .runWith({ timeoutSeconds: 60, memory: "512MB" })
  .https.onCall(async (data, context) => {
    try {
      // 1️⃣ AUTH
      if (!context.auth) {
        throw new functions.https.HttpsError(
          "unauthenticated",
          "User must be authenticated",
        );
      }

      const userId = context.auth.uid;

      // 2️⃣ PARAMETERS
      const planDate = data.planDate;

      if (!planDate) {
        throw new functions.https.HttpsError(
          "invalid-argument",
          "planDate is required",
        );
      }

      const db = admin.firestore();

      // 3️⃣ USER SETTINGS
      const userRef = db.collection("Users").doc(userId);
      const userSnap = await userRef.get();

      if (!userSnap.exists) {
        throw new functions.https.HttpsError(
          "not-found",
          "User document not found",
        );
      }

      const user = userSnap.data();

      const workStartHour = user.workStartHour || 8;
      const workEndHour = user.workEndHour || 22;
      const maxDeepWorkHours = user.maxDeepWorkHours || 4;

      // 4️⃣ WORK DAY TIME (FIXED)
      const [year, month, day] = planDate.split("-");

      const startOfDay = new Date(
        Date.UTC(Number(year), Number(month) - 1, Number(day)),
      );

      const tzOffset = 3; // или динамически

      const workStart = new Date(startOfDay);
      workStart.setUTCHours(workStartHour - tzOffset, 0, 0, 0);

      const workEnd = new Date(startOfDay);
      workEnd.setUTCHours(workEndHour - tzOffset, 0, 0, 0);

      // 5️⃣ LOAD TASKS
      const tasksSnap = await db
        .collection("Tasks")
        .where("userId", "==", userId)
        .where("status", "in", ["pending", "active"])
        .get();

      const tasks = tasksSnap.docs.map((doc) => ({
        id: doc.id,
        ...doc.data(),
      }));

      // 6️⃣ EVENTS
      const events = tasks.filter(
        (t) => t.type === "event" && t.scheduledStart && t.scheduledEnd,
      );

      // 7️⃣ TASKS ONLY
      const tasksOnlyRaw = tasks.filter((t) => t.type !== "event");

      const originalTasksMap = new Map();

      for (const t of tasksOnlyRaw) {
        originalTasksMap.set(t.id, t);
      }

      const tasksOnly = [];

      const CHUNK = 30; // minutes

      for (const task of tasksOnlyRaw) {
        const totalDuration = task.estimatedDurationMin || 30;

        if (totalDuration <= CHUNK) {
          tasksOnly.push({
            ...task,
            estimatedDurationMin: totalDuration,
          });
        } else {
          let remaining = totalDuration;
          let part = 1;

          while (remaining > 0) {
            const duration = Math.min(CHUNK, remaining);

            tasksOnly.push({
              ...task,
              estimatedDurationMin: duration,
              chunkPart: part,
            });

            remaining -= duration;
            part++;
          }
        }
      }

      tasksOnly.sort((a, b) => taskScore(b) - taskScore(a));

      // 8️⃣ BUSY SLOTS
      const busySlots = events.map((e) => ({
        start: new Date(e.scheduledStart.toDate()),
        end: new Date(e.scheduledEnd.toDate()),
      }));

      // 9️⃣ PRIORITY SCORE
      function taskScore(task) {
        let score = 0;

        // PRIORITY
        if (task.priority === "high") score += 100;
        if (task.priority === "medium") score += 50;

        // DEADLINE BOOST
        if (task.dueDate) {
          const hoursLeft = (task.dueDate.toDate() - new Date()) / 3600000;

          score += Math.max(0, 40 - hoursLeft);
        }

        // ENERGY SCHEDULING (по времени начала дня)
        const startHour = workStart.getHours();

        const isMorning = startHour < 12;
        const isAfternoon = startHour >= 14;

        if (task.energyType === "high" && isMorning) {
          score += 30;
        }

        if (task.energyType === "low" && isAfternoon) {
          score += 20;
        }

        return score;
      }

      // 🔟 FIND SLOT
      function findFreeSlot(startTime, durationMin) {
        let start = new Date(startTime);
        let safety = 0;

        while (true) {
          if (safety++ > 100) return null; // ✅ защита

          const end = new Date(start.getTime() + durationMin * 60000);

          const conflict = busySlots.find(
            (slot) => start < slot.end && end > slot.start,
          );

          if (!conflict) {
            return { start, end };
          }

          start = new Date(conflict.end);
        }
      }

      // ✅ SAFE DATE PARSER
      function toDateSafe(d) {
        if (!d) return null;
        if (d.toDate) return d.toDate(); // Firestore Timestamp
        return new Date(d); // string
      }

      // ✅ 1️⃣ ФУНКЦИЯ MERGE
      function mergeBlocks(blocks) {
        if (!blocks || blocks.length === 0) return [];

        // сортировка по start
        blocks.sort((a, b) => a.start.toDate() - b.start.toDate());

        const merged = [];
        let current = blocks[0];

        for (let i = 1; i < blocks.length; i++) {
          const next = blocks[i];

          const currentEnd = current.end.toDate();
          const nextStart = next.start.toDate();

          // если блоки соприкасаются или почти соприкасаются (<=5 минут gap)
          const gap = (nextStart - currentEnd) / 60000;

          if (gap <= 5) {
            // расширяем текущий блок
            current.end = next.end;
          } else {
            merged.push(current);
            current = next;
          }
        }

        merged.push(current);

        return merged;
      }

      // =======================
      // 🛡️ CONSTRAINT GUARD
      // =======================

      function guardSchedule(schedule, originalTasksMap, workStart, workEnd) {
        const safe = [];

        for (const item of schedule) {
          const original = originalTasksMap.get(item.taskId);

          if (!original) continue;

          // 1️⃣ BLOCKS CHECK
          if (!item.blocks || item.blocks.length === 0) continue;

          // сортировка
          const sortedBlocks = [...item.blocks].sort(
            (a, b) => new Date(a.start) - new Date(b.start),
          );

          const validBlocks = [];

          for (const b of sortedBlocks) {
            const start = toDateSafe(b.start);
            const end = toDateSafe(b.end);

            // ❌ вне рабочего дня
            if (start < workStart || end > workEnd) continue;
            // ❌ некорректное время
            if (end <= start) continue;
            // ❌ дедлайн
            if (original.dueDate) {
              const deadline = new Date(original.dueDate.toDate());
              if (end > deadline) continue;
            }

            validBlocks.push({
              start: admin.firestore.Timestamp.fromDate(start),
              end: admin.firestore.Timestamp.fromDate(end),
            });
          }

          if (validBlocks.length === 0) continue;

          // 2️⃣ TOTAL DURATION CHECK
          let total = 0;
          for (const b of validBlocks) {
            total += (b.end.toDate() - b.start.toDate()) / 60000;
          }

          const expected = original.estimatedDurationMin || 30;

          // если AI сильно изменил длительность — откатываем
          if (Math.abs(total - expected) > 30) {
            continue;
          }

          safe.push({
            ...item,
            blocks: validBlocks,
            totalDurationMin: total,
            scheduledStart: validBlocks[0].start,
            scheduledEnd: validBlocks[validBlocks.length - 1].end,
          });
        }

        // 3️⃣ УБИРАЕМ ПЕРЕСЕЧЕНИЯ
        safe.sort(
          (a, b) => a.scheduledStart.toDate() - b.scheduledStart.toDate(),
        );

        const finalSchedule = [];
        let lastEnd = null;

        for (const item of safe) {
          if (!lastEnd) {
            finalSchedule.push(item);
            lastEnd = item.scheduledEnd.toDate();
            continue;
          }

          if (item.scheduledStart.toDate() >= lastEnd) {
            finalSchedule.push(item);
            lastEnd = item.scheduledEnd.toDate();
          }
        }

        return finalSchedule;
      }

      // 1️⃣1️⃣ BUILD SCHEDULE
      let currentTime = new Date(workStart);
      let deepWorkMinutes = 0;

      const scheduleMap = new Map();

      for (const task of tasksOnly) {
        const duration = task.estimatedDurationMin || 30;

        const slot = findFreeSlot(currentTime, duration);

        // конец рабочего дня
        if (!slot) break;

        // ✅ DEADLINE CHECK
        if (task.dueDate) {
          const deadline = new Date(task.dueDate.toDate());
          if (slot.end > deadline) {
            continue;
          }
        }

        // deep work limit
        if (task.energyType === "high") {
          if (deepWorkMinutes + duration > maxDeepWorkHours * 60) {
            continue;
          }

          deepWorkMinutes += duration;
        }

        // добавляем задачу в schedule
        const key = task.id;

        if (!scheduleMap.has(key)) {
          scheduleMap.set(key, {
            taskId: task.id,
            title: task.title || "",
            description: task.description || "",
            priority: task.priority || "medium",
            energyType: task.energyType || "low",
            type: task.type || "task",

            totalDurationMin: 0,
            blocks: [],
          });
        }

        const entry = scheduleMap.get(key);

        entry.blocks.push({
          start: admin.firestore.Timestamp.fromDate(slot.start),
          end: admin.firestore.Timestamp.fromDate(slot.end),
        });

        entry.totalDurationMin += duration;

        busySlots.push(slot);

        // ✅ BREAK 10 min
        const breakSlot = findFreeSlot(slot.end, 10);
        if (breakSlot) {
          busySlots.push(breakSlot);
          currentTime = breakSlot.end;
        } else {
          currentTime = slot.end;
        }
      }

      // 1️⃣2️⃣ CREATE PROPOSAL
      const proposalRef = db.collection("Schedule_Proposals").doc();

      const schedule = Array.from(scheduleMap.values())
        .map((item) => {
          const mergedBlocks = mergeBlocks(item.blocks);

          // пересчёт totalDuration
          let total = 0;
          for (const b of mergedBlocks) {
            const duration = (b.end.toDate() - b.start.toDate()) / 60000;
            total += duration;
          }

          if (!mergedBlocks || mergedBlocks.length === 0) {
            return null; // или можно пропустить элемент
          }

          return {
            ...item,
            scheduledStart: mergedBlocks[0].start,
            scheduledEnd: mergedBlocks[mergedBlocks.length - 1].end,
            blocks: mergedBlocks,
            totalDurationMin: total,
          };
        })
        .filter((item) => item !== null);

      // =======================
      // 🤖 GEMINI OPTIMIZATION
      // =======================

      // ограничим размер (важно для latency)
      const scheduleForAI = schedule.slice(0, 20);

      const aiInput = {
        workStart,
        workEnd,
        schedule: scheduleForAI,
      };

      const prompt = `
  You are an AI daily planner optimizer.

  You receive a structured schedule with tasks and time blocks.

  Your goal:
  - Make the schedule more natural for a human
  - Merge fragmented work where possible
  - Avoid too many context switches
  - Keep deadlines respected
  - Keep total durations unchanged
  - DO NOT remove tasks
  - DO NOT change taskId

  Return ONLY valid JSON.

  INPUT:
  ${JSON.stringify(aiInput)}
  `;

      let optimizedSchedule = schedule;

      try {
        const response = await fetch(
          "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=AIzaSyAjyQMXHWyPNNT3CHnlEbRAHbqeag63wu8", //+ process.env.GEMINI_API_KEY,
          {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              contents: [
                {
                  parts: [{ text: prompt }],
                },
              ],
            }),
          },
        );

        const aiText = data.candidates?.[0]?.content?.parts?.[0]?.text || "";

        if (aiText) {
          let cleanText = aiText
            .replace(/```json/g, "")
            .replace(/```/g, "")
            .trim();

          const parsed = JSON.parse(cleanText);

          // ✅ защита
          if (Array.isArray(parsed) && parsed.length > 0) {
            optimizedSchedule = parsed.map((item) => {
              if (!item.blocks || item.blocks.length === 0) {
                return item;
              }

              // ✅ СОРТИРОВКА (КРИТИЧНО)
              const sortedBlocks = [...item.blocks].sort(
                (a, b) => toDateSafe(a.start) - toDateSafe(b.start),
              );

              const normalizedBlocks = sortedBlocks.map((b) => ({
                start: admin.firestore.Timestamp.fromDate(new Date(b.start)),
                end: admin.firestore.Timestamp.fromDate(new Date(b.end)),
              }));

              return {
                ...item,
                blocks: normalizedBlocks,
                scheduledStart: sortedBlocks[0]?.start || null,
                scheduledEnd:
                  sortedBlocks[sortedBlocks.length - 1]?.end || null,
              };
            });
          }
        }
      } catch (e) {
        console.error("Gemini error:", e);
      }

      // Constraint Guard Layer
      if (!optimizedSchedule || !optimizedSchedule.length) {
        optimizedSchedule = schedule;
      }

      optimizedSchedule = guardSchedule(
        optimizedSchedule,
        originalTasksMap,
        workStart,
        workEnd,
      );

      await proposalRef.set({
        proposalId: proposalRef.id,
        userId: userId,
        planDate: planDate,
        status: "draft",
        schedule: optimizedSchedule,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      // 1️⃣3️⃣ RETURN
      return {
        proposalId: proposalRef.id,
      };
    } catch (error) {
      console.error("generateDailyPlan error:", error);
      throw new functions.https.HttpsError("internal", error.message);
    }
  });

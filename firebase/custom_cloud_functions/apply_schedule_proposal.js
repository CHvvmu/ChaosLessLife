const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

function toDateSafe(d) {
  if (!d) return null;
  if (d.toDate) return d.toDate();
  return new Date(d);
}

exports.applyScheduleProposal = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Требуется авторизация",
      );
    }

    const userId = context.auth.uid;
    const { proposalId } = data;

    const db = admin.firestore();

    const proposalRef = db.collection("Schedule_Proposals").doc(proposalId);
    const scheduleRef = db.collection("Schedules").doc();

    return await db.runTransaction(async (tx) => {
      const proposalDoc = await tx.get(proposalRef);

      if (!proposalDoc.exists) {
        throw new functions.https.HttpsError(
          "not-found",
          "Предложение не найдено",
        );
      }

      const proposal = proposalDoc.data();

      if (proposal.userId !== userId) {
        throw new functions.https.HttpsError(
          "permission-denied",
          "Не Ваше предложение",
        );
      }

      if (proposal.status !== "draft") {
        // ← у тебя draft, не pending
        throw new functions.https.HttpsError(
          "failed-precondition",
          "Уже обработано",
        );
      }

      const scheduleId = scheduleRef.id;

      // ✅ создаём Schedule
      tx.set(scheduleRef, {
        userId,
        planDate: proposal.planDate || null,
        sourceProposalId: proposalId,
        status: "active",
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      let applied = 0;
      let skipped = 0;

      // ✅ ВАЖНО: используем schedule
      for (const item of proposal.schedule || []) {
        const start = toDateSafe(item.scheduledStart);
        const end = toDateSafe(item.scheduledEnd);

        if (!item.taskId || !start || !end) {
          skipped++;
          continue;
        }

        const itemRef = scheduleRef.collection("items").doc();

        tx.set(itemRef, {
          taskId: item.taskId,

          title: item.title || "",
          description: item.description || "",

          start: start,
          end: end,

          durationMin: item.totalDurationMin || 30,

          priority: item.priority || "medium",
          energyType: item.energyType || "low",

          order: applied,

          status: "planned",
          locked: false,
          source: "ai",

          createdAt: admin.firestore.FieldValue.serverTimestamp(),
          updatedAt: admin.firestore.FieldValue.serverTimestamp(),
        });

        // ✅ (опционально) обновляем Task
        const taskRef = db.collection("Tasks").doc(item.taskId);

        tx.set(
          taskRef,
          {
            scheduledStart: start,
            scheduledEnd: end,
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
          },
          { merge: true },
        );

        applied++;
      }

      // ✅ обновляем proposal
      tx.update(proposalRef, {
        status: "applied",
        appliedAt: admin.firestore.FieldValue.serverTimestamp(),
        scheduleId: scheduleId,
      });
      console.log("APPLIED:", applied, "SKIPPED:", skipped);
      return {
        success: true,
        scheduleId,
        applied,
        skipped,
      };
    });
  },
);

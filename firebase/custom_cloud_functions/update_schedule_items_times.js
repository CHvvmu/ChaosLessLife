const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateScheduleItemsTimes = functions.https.onCall(
  async (data, context) => {
    const { scheduleId, items } = data;

    if (!scheduleId || !items) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Missing scheduleId or items",
      );
    }

    const db = admin.firestore();
    const batch = db.batch();

    const scheduleRef = db.collection("Schedules").doc(scheduleId);

    for (const item of items) {
      const ref = scheduleRef.collection("items").doc(item.id);

      const updateData = {
        start: admin.firestore.Timestamp.fromDate(new Date(item.start)),
        end: admin.firestore.Timestamp.fromDate(new Date(item.end)),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      };

      // ✅ безопасное обновление (и для drag, и для edit)
      if (item.durationMin !== undefined) {
        updateData.durationMin = item.durationMin;
      }

      if (item.locked !== undefined) {
        updateData.locked = item.locked === true;
      }

      batch.update(ref, updateData);
    }

    await batch.commit();

    return { success: true };
  },
);

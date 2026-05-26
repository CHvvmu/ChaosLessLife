const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateSingleScheduleItem = functions.https.onCall(
  async (data, context) => {
    const { scheduleId, itemId, start, end, duration, locked } = data;

    const db = admin.firestore();
    const scheduleRef = db.collection("Schedules").doc(scheduleId);

    const itemsSnap = await scheduleRef.collection("items").get();

    const batch = db.batch();

    // обновляем текущий item
    const ref = scheduleRef.collection("items").doc(itemId);

    batch.update(ref, {
      start: admin.firestore.Timestamp.fromDate(new Date(start)),
      end: admin.firestore.Timestamp.fromDate(new Date(end)),
      durationMin: duration,
      locked: locked,
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    await batch.commit();

    return { success: true };
  },
);

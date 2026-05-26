const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.reorderScheduleItems = functions.https.onCall(async (data, context) => {
  const { scheduleId, orderedIds } = data;

  const db = admin.firestore();
  const scheduleRef = db.collection("Schedules").doc(scheduleId);

  const batch = db.batch();

  for (let i = 0; i < orderedIds.length; i++) {
    const ref = scheduleRef.collection("items").doc(orderedIds[i]);

    batch.update(ref, {
      order: i,
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    });
  }

  await batch.commit();

  return { success: true };
});

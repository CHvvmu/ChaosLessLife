const functions = require("firebase-functions");
const admin = require("firebase-admin");
// НЕ вызываем admin.initializeApp()

exports.processVoiceCapture = functions
  .runWith({ timeoutSeconds: 30, memory: "256MB" })
  .firestore.document("capture_sessions/{sessionId}")
  .onCreate(async (snap, context) => {
    const data = snap.data();
    const ref = snap.ref;
    const captureSessionId = context.params.sessionId;

    // Only process voice captures with a real audioUrl
    if (!data.audioUrl || data.status !== "pending") return null;

    try {
      const aiSessionRef = admin.firestore().collection("AI_sessions").doc();

      await aiSessionRef.set({
        userId: data.userId,
        audioUrl: data.audioUrl,
        mode: "voice",
        status: "pending",
        captureSessionId: captureSessionId,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      await ref.update({
        aiSessionId: aiSessionRef.id,
        status: "transcribing",
      });

      return null;
    } catch (error) {
      await ref.update({
        status: "error",
        errorMessage: error.message || "Failed to create AI session",
      });
      return null;
    }
  });

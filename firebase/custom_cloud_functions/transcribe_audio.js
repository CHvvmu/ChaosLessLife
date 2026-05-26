const functions = require("firebase-functions");
const admin = require("firebase-admin");
// НЕ вызываем admin.initializeApp()

exports.transcribeAudio = functions
  .runWith({
    timeoutSeconds: 120,
    memory: "1GB",
  })
  .firestore.document("AI_sessions/{sessionId}")
  .onCreate(async (snap, context) => {
    const data = snap.data();
    const ref = snap.ref;

    try {
      if (!data.audioUrl) {
        await ref.update({
          status: "error",
          errorMessage: "audioUrl missing",
        });
        return null;
      }

      await ref.update({ status: "transcribing" });

      // 1️⃣ Скачать аудио
      const audioResponse = await fetch(data.audioUrl);

      if (!audioResponse.ok) {
        throw new Error("Не удалось загрузить аудиофайл");
      }

      const audioBuffer = await audioResponse.arrayBuffer();
      const base64Audio = Buffer.from(audioBuffer).toString("base64");

      // ⚠ ВСТАВЬ СВОЙ РЕАЛЬНЫЙ КЛЮЧ ЗДЕСЬ
      const API_KEY = "AIzaSyD31pP6opTTwUjywN-4FXR7G0u_Vi-x2YM";

      // 2️⃣ Отправить в Gemini
      const geminiResponse = await fetch(
        "https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "x-goog-api-key": API_KEY,
          },
          body: JSON.stringify({
            contents: [
              {
                parts: [
                  {
                    inlineData: {
                      mimeType: "audio/m4a", // поменяй если mp3/wav
                      data: base64Audio,
                    },
                  },
                  {
                    text: "Переведите этот аудиофайл в текст. Верните только обычный текст.",
                  },
                ],
              },
            ],
          }),
        },
      );

      if (!geminiResponse.ok) {
        const errorText = await geminiResponse.text();
        throw new Error(`Gemini API error: ${errorText}`);
      }

      const result = await geminiResponse.json();

      const transcript = result?.candidates?.[0]?.content?.parts?.[0]?.text;

      if (!transcript) {
        throw new Error("Gemini не вернул транскрипт");
      }

      await ref.update({
        transcript: transcript,
        status: "processed",
        processedAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      return null;
    } catch (error) {
      await ref.update({
        status: "error",
        errorMessage: error.message || "Неизвестная ошибка",
      });

      return null;
    }
  });

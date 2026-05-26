const functions = require("firebase-functions");
const admin = require("firebase-admin");
const crypto = require("crypto");
// Node 20 имеет глобальный fetch — require("node-fetch") не нужен
// ⚠️ admin.initializeApp() НЕ использовать в FlutterFlow

exports.extractTasks = functions
  .runWith({ timeoutSeconds: 60, memory: "512MB", secrets: ["GEMINI_API_KEY"] })
  .firestore.document("AI_sessions/{sessionId}")
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    const ref = change.after.ref;

    // ================================
    // ЗАЩИТА ОТ ПОВТОРНОГО ЗАПУСКА
    // ================================

    if (!after.transcript) return null;
    if (!after.userId) return null;

    if (after.aiStatus === "completed") return null;
    if (after.aiStatus === "extracting") return null;

    if (before && before.transcript === after.transcript) return null;

    const lock = await admin.firestore().runTransaction(async (tx) => {
      const snap = await tx.get(ref);

      const data = snap.data();

      if (!data) return false;

      if (data.aiStatus === "extracting") return false;
      if (data.aiStatus === "completed") return false;

      tx.update(ref, {
        aiStatus: "extracting",
        aiError: null,
      });

      return true;
    });

    if (!lock) {
      return null;
    }

    try {
      // ⚠ ВСТАВЬ СВОЙ РЕАЛЬНЫЙ КЛЮЧ ЗДЕСЬ
      const API_KEY = process.env.GEMINI_API_KEY;

      const userId = after.userId;
      const sessionId = context.params.sessionId;

      const userTimezone = after.userTimezone || after.timezone || "UTC";

      const currentISO = getUserLocalISO(userTimezone);
      const now = new Date(currentISO);

      const prompt = buildPrompt({
        transcript: after.transcript,
        currentISO: currentISO,
        currentYear: now.getFullYear(),
        timezone: userTimezone,
      });

      // ================================
      // GEMINI REQUEST
      // ================================

      const geminiResponse = await fetch(
        "https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "x-goog-api-key": API_KEY,
          },
          body: JSON.stringify({
            contents: [{ parts: [{ text: prompt }] }],
            generationConfig: {
              temperature: 0.2,
              topP: 0.8,
              maxOutputTokens: 2048,
            },
          }),
        },
      );

      if (!geminiResponse.ok) {
        throw new Error(await geminiResponse.text());
      }

      const result = await geminiResponse.json();

      const rawText =
        result.candidates?.[0]?.content?.parts
          ?.map((p) => (typeof p.text === "string" ? p.text : ""))
          .join("") || "";

      if (!rawText) throw new Error("Gemini response empty");

      const jsonMatch = rawText.match(/\{.*\}/s);

      if (!jsonMatch) throw new Error("Invalid Gemini JSON");

      //const parsed = JSON.parse(jsonMatch[0]);
      const parsed = extractAIJson(rawText);
      if (!parsed) {
        await ref.update({ aiStatus: "completed" });
        return null;
      }
      //

      if (!Array.isArray(parsed.items)) {
        throw new Error("No items array");
      }

      // ================================
      // БЕРЕМ ТОЛЬКО ПЕРВУЮ ЗАДАЧУ
      // ================================

      const item = parsed.items[0];

      if (!item) {
        await ref.update({ aiStatus: "completed" });
        return null;
      }

      const title = (item.title || "").trim();
      if (!title) {
        await ref.update({ aiStatus: "completed" });
        return null;
      }

      // ================================
      // ПАРСИНГ ВРЕМЕНИ (БЕЗ TZ)
      // ================================

      const parsedStart = parseUserLocalDate(item.scheduledStart);
      const parsedEnd = parseUserLocalDate(item.scheduledEnd);

      const normalized = normalizeScheduleSafe({
        ...item,
        scheduledStart: parsedStart,
        scheduledEnd: parsedEnd,
      });

      const finalStart = normalized.scheduledStart;
      const finalEnd = normalized.scheduledEnd;

      const dueDate = item.dueDate
        ? parseUserLocalDate(item.dueDate)
        : finalEnd || null;

      const estimatedDuration =
        item.estimatedDurationMin ||
        (finalStart && finalEnd
          ? Math.round((finalEnd - finalStart) / 60000)
          : 60);

      const flexibility =
        typeof item.flexibility === "number"
          ? Math.min(4, Math.max(0, item.flexibility))
          : item.type === "event"
            ? 0
            : 2;

      const baseDate = item.scheduledStart || item.dueDate || "";

      const dedupeHash = crypto
        .createHash("sha256")
        .update(userId + title.toLowerCase() + baseDate)
        .digest("hex");

      const batch = admin.firestore().batch();

      const subCollection = admin.firestore().collection("tasksSub");
      const globalCollection = admin.firestore().collection("Tasks");
      const createdTaskIds = [];
      const createdGlobalIds = [];

      // ================================
      // ПРОВЕРКА ДУБЛИКАТОВ
      // ================================

      const existing = await globalCollection
        .where("dedupeHash", "==", dedupeHash)
        .limit(1)
        .get();

      const alreadyExists = !existing.empty;

      // ================================
      // СОЗДАЕМ TASK SUB
      // ================================

      const subRef = subCollection.doc();
      createdTaskIds.push(subRef.id);
      batch.set(subRef, {
        userId,
        sessionId,
        title,
        description: item.description || null,

        dueDate: dueDate
          ? admin.firestore.Timestamp.fromDate(shiftMinus3(dueDate))
          : null,

        scheduledStart: finalStart
          ? admin.firestore.Timestamp.fromDate(shiftMinus3(finalStart))
          : null,

        scheduledEnd: finalEnd
          ? admin.firestore.Timestamp.fromDate(shiftMinus3(finalEnd))
          : null,

        estimatedDurationMin: estimatedDuration,

        priority: item.priority || "medium",
        type: item.type || "task",

        status: "active",
        source: "ai_voice",

        dedupeHash,

        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      // ================================
      // СОЗДАЕМ ГЛОБАЛЬНУЮ TASK
      // ================================

      if (!alreadyExists) {
        const globalRef = globalCollection.doc();
        createdGlobalIds.push(globalRef.id);
        batch.set(globalRef, {
          userId,
          sessionId,
          title,
          description: item.description || null,

          dueDate: dueDate
            ? admin.firestore.Timestamp.fromDate(shiftMinus3(dueDate))
            : null,

          scheduledStart: finalStart
            ? admin.firestore.Timestamp.fromDate(shiftMinus3(finalStart))
            : null,

          scheduledEnd: finalEnd
            ? admin.firestore.Timestamp.fromDate(shiftMinus3(finalEnd))
            : null,

          estimatedDurationMin: estimatedDuration,

          flexibility,

          energyType: item.energyType || "medium",
          priority: item.priority || "medium",

          type: item.type || "task",
          status: "active",
          source: "ai_voice",

          dedupeHash,

          createdAt: admin.firestore.FieldValue.serverTimestamp(),
          updatedAt: admin.firestore.FieldValue.serverTimestamp(),
        });
      }

      await batch.commit();

      await ref.update({
        aiStatus: "completed",
        tasksSubIds: createdTaskIds,
        tasksIds: createdGlobalIds || [],
      });

      // ================================
      // СОЗДАЕМ SCHEDULE ENTRY (для PlanBoard / TodayPage)
      // Только если задача имеет конкретное время и не является дубликатом
      // ================================

      if (finalStart && finalEnd && !alreadyExists) {
        try {
          // parsedStart содержит "локальное" время пользователя (UTC+3),
          // выраженное как UTC Date (сервер работает в UTC).
          // Полночь UTC+3 в UTC = getDate() - 3h
          const localMidnight = new Date(
            parsedStart.getFullYear(),
            parsedStart.getMonth(),
            parsedStart.getDate(),
            0,
            0,
            0,
            0,
          );
          const scheduleDateUTC = new Date(
            localMidnight.getTime() - 3 * 60 * 60 * 1000,
          );
          const scheduleDateTs =
            admin.firestore.Timestamp.fromDate(scheduleDateUTC);

          // Находим или создаём Schedule-документ для этого дня
          const schedulesSnap = await admin
            .firestore()
            .collection("Schedules")
            .where("userId", "==", userId)
            .where("date", "==", scheduleDateTs)
            .limit(1)
            .get();

          let scheduleRef;
          if (schedulesSnap.empty) {
            scheduleRef = admin.firestore().collection("Schedules").doc();
            await scheduleRef.set({
              userId,
              date: scheduleDateTs,
              status: "active",
              createdAt: admin.firestore.FieldValue.serverTimestamp(),
              updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            });
          } else {
            scheduleRef = schedulesSnap.docs[0].ref;
            await scheduleRef.update({
              updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            });
          }

          // Порядок = число уже существующих items
          const existingItemsSnap = await scheduleRef.collection("items").get();
          const itemOrder = existingItemsSnap.size;

          // Создаём items-запись для PlanBoard
          await scheduleRef
            .collection("items")
            .doc()
            .set({
              taskId: createdGlobalIds[0] || subRef.id,
              title,
              description: item.description || null,
              start: admin.firestore.Timestamp.fromDate(
                shiftMinus3(finalStart),
              ),
              end: admin.firestore.Timestamp.fromDate(shiftMinus3(finalEnd)),
              durationMin: estimatedDuration,
              order: itemOrder,
              status: "active",
              locked: false,
              source: "ai_voice",
              createdAt: admin.firestore.FieldValue.serverTimestamp(),
            });
        } catch (scheduleError) {
          console.error("Failed to create schedule entry:", scheduleError);
          // Не критично — задача в tasksSub/Tasks уже создана
        }
      }

      // Signal back to capture_sessions that processing is done
      if (after.captureSessionId) {
        try {
          await admin
            .firestore()
            .collection("capture_sessions")
            .doc(after.captureSessionId)
            .update({
              status: "processed",
              processedAt: admin.firestore.FieldValue.serverTimestamp(),
              inboxItemId: createdTaskIds[0] || null,
            });
        } catch (_) {
          // non-critical — capture_sessions may have been deleted
        }
      }

      return null;
    } catch (error) {
      console.error("extractTasks error:", error);

      await ref.update({
        aiStatus: "error",
        aiError: error.message || String(error),
      });

      return null;
    }
  });

// ✅ Промт для AI
/* ======= PROMPT ======= */
/* ====================== */
function buildPrompt({ transcript, currentISO, currentYear, timezone }) {
  return `
    You are a structured task extraction engine.

    Your job is to extract tasks and calendar events from voice notes.

    --------------------------------
    CURRENT CONTEXT
    --------------------------------

    CURRENT_TIME: ${currentISO}
    CURRENT_YEAR: ${currentYear}
    USER_TIMEZONE: ${timezone}

    All relative dates MUST be interpreted in USER_TIMEZONE.

    Day boundaries MUST use USER_TIMEZONE, not UTC.

    Example:
    If today is March 9 in USER_TIMEZONE, then:
    start of today = 00:00:00 in USER_TIMEZONE
    end of today = 23:59:59 in USER_TIMEZONE

    --------------------------------
    OUTPUT REQUIREMENTS
    --------------------------------

    Return ONLY valid JSON.
    If no tasks exist return:
      {
        "items": []
      }
    
    Do NOT include markdown.
    Do NOT include explanations.
    Do NOT include comments.

    Return exactly this structure:

    {
      "items": [
        {
          "type": "task | event",
          "title": "string",
          "description": "string or null",
          "scheduledStart": "YYYY-MM-DDTHH:mm:ss (NO timezone) or null",
          "scheduledEnd": "YYYY-MM-DDTHH:mm:ss (NO timezone) or null",
          "dueDate": "YYYY-MM-DDTHH:mm:ss (NO timezone) or null",
          "estimatedDurationMin": number,
          "priority": "low | medium | high",
          "flexibility": number,
          "energyType": "low | medium | high"
        }
      ]
    }


    --------------------------------
    TIMEZONE RULE (CRITICAL)
    --------------------------------

    All returned timestamps MUST NOT contain any timezone.

    Do NOT include:
    Z
    +03:00
    -05:00
    UTC offsets

    Correct example:
    2026-03-14T22:00:00

    Incorrect examples:
    2026-03-14T22:00:00+03:00
    2026-03-14T22:00:00Z

    All timestamps must represent LOCAL USER TIME already.

    --------------------------------
    EXTRACTION RULES
    --------------------------------

    You must strictly extract tasks that are explicitly mentioned in the text.

    Do NOT invent tasks.

    Do NOT split one task into multiple tasks unless the text clearly contains separate actions.

    Prefer fewer tasks rather than more.

    If the user describes one action with additional context, keep it as a single item.

    Examples:

    Input:
    "Позвонить Ивану завтра в 14 и обсудить проект"

    Correct:
    1 task

    Incorrect:
    2 tasks (call + discuss project)

    --------------------------------
    DETERMINISTIC OUTPUT
    --------------------------------

    Your output must be deterministic.

    For the same input text you must always produce the same JSON structure.

    Do not rephrase titles randomly.

    Do not add extra fields.

    --------------------------------
    EMPTY RESULT RULE
    --------------------------------

    If the text contains no actionable tasks or events return exactly:

    {
      "items": []
    }

    --------------------------------
    TYPE DETECTION
    --------------------------------

    Use "event" when the task has a fixed time.

    Examples:
    meeting
    call at specific time
    appointment
    conference
    webinar
    flight
    doctor visit

    Use "task" when time is flexible.

    Examples:
    write report
    call someone later
    buy groceries
    plan something
    prepare documents

    --------------------------------
    DATE INTERPRETATION RULES
    --------------------------------

    Resolve relative dates using CURRENT_TIME and USER_TIMEZONE.
    Never convert times to UTC.
    Never shift hours.
    Always keep the exact hour mentioned in the text.
    Examples:

    "today"
    → same calendar day in USER_TIMEZONE

    "tomorrow"
    → next day in USER_TIMEZONE

    "tonight"
    → today evening (after 18:00)

    "next week"
    → Monday of next week

    If a day is mentioned but no time is given:

    scheduledStart = null
    scheduledEnd = null
    dueDate = end of that day (23:59:59 in USER_TIMEZONE)

    --------------------------------
    TIME NORMALIZATION
    --------------------------------

    All times must be returned in ISO format WITHOUT timezone.
    Format strictly:
    YYYY-MM-DDTHH:mm:ss

    Always include date and time if time is known.

    Examples:

    14:00 tomorrow
    → YYYY-MM-DDT14:00:00

    If only a date is known:

    scheduledStart = null
    scheduledEnd = null
    dueDate = YYYY-MM-DDT23:59:59

    If time is mentioned without a date:

    assume the nearest future time relative to CURRENT_TIME in USER_TIMEZONE.

    --------------------------------
    TIME RANGE RULES
    --------------------------------

    If the text contains a clear time range:

    Examples:
    "from 14 to 16"
    "14:00–15:30"
    "between 9 and 10"

    Then:

    scheduledStart = start time
    scheduledEnd = end time
    dueDate = scheduledEnd

    estimatedDurationMin = difference between times

    --------------------------------
    DURATION RULES
    --------------------------------

    If duration is mentioned:

    Examples:
    "30 minutes"
    "half an hour"
    "2 hours"

    Convert to minutes.

    If both duration AND start time exist:

    scheduledEnd = scheduledStart + duration

    If no duration is mentioned:

    default estimatedDurationMin = 60

    --------------------------------
    FLEXIBLE TIME EXPRESSIONS
    --------------------------------

    If user says:

    "when possible"
    "later"
    "в свободное окно"
    "when I have time"
    "at some point today"

    Then:

    scheduledStart = null
    scheduledEnd = null

    Use dueDate only if a day is mentioned.

    --------------------------------
    TASK NORMALIZATION
    --------------------------------

    Title should be short and clear.

    Remove filler words and conversational phrases.

    Keep only the core action.

    Examples:

    "Мне нужно завтра позвонить Ивану и обсудить проект"
    → "Позвонить Ивану"

    "Надо бы купить продукты вечером"
    → "Купить продукты"

    "I should finish the report tomorrow morning"
    → "Finish report"

    "Нужно записаться к врачу на следующей неделе"
    → "Записаться к врачу"

    Move extra context to the description field.
    Title should normally contain 2–6 words.

    --------------------------------
    LANGUAGE DETECTION
    --------------------------------

    Detect the language of the input text automatically.

    --------------------------------
    TITLE LANGUAGE RULE
    --------------------------------

    The title MUST stay in the same language as the input text.

    Do NOT translate titles.

    Examples:

    "Сегодня позвонить Ивану"
    → "Позвонить Ивану"

    "Call John tomorrow"
    → "Call John"

    Use the same language for description as the input text.

    Long context should go to description.

    --------------------------------
    PRIORITY RULES
    --------------------------------

    Detect urgency from language.

    urgent / срочно → high
    important → high
    normal wording → medium
    optional → low

    Default: medium.

    --------------------------------
    ENERGY TYPE
    --------------------------------

    Estimate mental effort.

    high:
    deep work
    planning
    coding
    writing

    medium:
    calls
    emails
    coordination

    low:
    quick admin tasks
    simple errands

    Default: medium.

    --------------------------------
    FLEXIBILITY SCALE
    --------------------------------

    0 = fixed time (event)
    1 = low flexibility
    2 = medium flexibility
    3 = flexible
    4 = very flexible

    Events must have flexibility = 0.

    --------------------------------
    TEXT
    --------------------------------

    ${transcript}

    `;
}

/* ------------------------------------------------ */
/* Вычитает 3 часа */
/* ------------------------------------------------ */

function shiftMinus3(date) {
  if (!date) return null;

  return new Date(date.getTime() - 3 * 60 * 60 * 1000);
}

/* ------------------------------------------------ */
/* DATE PARSER (БЕЗ TZ СМЕЩЕНИЯ) */
/* ------------------------------------------------ */

function parseUserLocalDate(dateStr) {
  if (!dateStr) return null;
  if (typeof dateStr !== "string") return null;

  // убираем timezone (+03:00, -05:00, Z)
  const clean = dateStr.replace(/([+-]\d{2}:\d{2}|Z)$/, "");

  const m = clean.match(
    /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})(?::(\d{2}))?/,
  );

  if (!m) return null;

  const year = Number(m[1]);
  const month = Number(m[2]) - 1;
  const day = Number(m[3]);
  const hour = Number(m[4]);
  const minute = Number(m[5]);
  const second = Number(m[6] || 0);

  // создаём дату строго из чисел — JS не применяет timezone
  return new Date(year, month, day, hour, minute, second);
}

/* ------------------------------------------------ */
/* NORMALIZE SCHEDULE */
/* ------------------------------------------------ */

function normalizeScheduleSafe(item) {
  // здесь даты уже должны быть Date объектами
  let start = item.scheduledStart || null;
  let end = item.scheduledEnd || null;

  // если есть start и duration → считаем end
  if (start && !end && item.estimatedDurationMin) {
    end = new Date(start.getTime() + item.estimatedDurationMin * 60000);
  }

  // если есть dueDate, но нет end
  if (!end && item.dueDate instanceof Date) {
    const endOfDay = new Date(item.dueDate);

    endOfDay.setHours(23, 59, 59, 999);

    end = endOfDay;
  }

  return {
    scheduledStart: start,
    scheduledEnd: end,
  };
}

/* ------------------------------------------------ */
/* формирует строку времени в формате ISO, но в часовом поясе пользователя, а не в UTC */
/* ------------------------------------------------ */

function getUserLocalISO(timezone) {
  const now = new Date();

  const parts = new Intl.DateTimeFormat("en-CA", {
    timeZone: timezone,
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit",
    hourCycle: "h23",
  }).formatToParts(now);

  const map = {};
  parts.forEach((p) => (map[p.type] = p.value));

  return `${map.year}-${map.month}-${map.day}T${map.hour}:${map.minute}:${map.second}`;
}

/* ------------------------------------------------ */
/* функция извлечения JSON из transcript */
/* ------------------------------------------------ */

function extractAIJson(rawText) {
  if (!rawText) return null;

  // 1️⃣ Попытка извлечь JSON из markdown ```json ```
  const markdownMatch = rawText.match(/```json\s*([\s\S]*?)\s*```/i);
  if (markdownMatch) {
    try {
      return JSON.parse(markdownMatch[1]);
    } catch (e) {}
  }

  // 2️⃣ Попытка извлечь первый JSON объект
  const jsonMatch = rawText.match(/\{[\s\S]*\}/);
  if (jsonMatch) {
    try {
      return JSON.parse(jsonMatch[0]);
    } catch (e) {}
  }

  // 3️⃣ Попытка найти JSON вручную
  const start = rawText.indexOf("{");
  const end = rawText.lastIndexOf("}");

  if (start !== -1 && end !== -1 && end > start) {
    try {
      const jsonString = rawText.slice(start, end + 1);
      return JSON.parse(jsonString);
    } catch (e) {}
  }

  console.log("AI JSON parsing failed");
  return null;
}

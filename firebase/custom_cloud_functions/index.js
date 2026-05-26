const admin = require("firebase-admin/app");
admin.initializeApp();

const transcribeAudio = require("./transcribe_audio.js");
exports.transcribeAudio = transcribeAudio.transcribeAudio;
const extractTasks = require("./extract_tasks.js");
exports.extractTasks = extractTasks.extractTasks;
const applyScheduleProposal = require("./apply_schedule_proposal.js");
exports.applyScheduleProposal = applyScheduleProposal.applyScheduleProposal;
const generateDailyPlan = require("./generate_daily_plan.js");
exports.generateDailyPlan = generateDailyPlan.generateDailyPlan;
const reorderScheduleItems = require("./reorder_schedule_items.js");
exports.reorderScheduleItems = reorderScheduleItems.reorderScheduleItems;
const updateScheduleItemsTimes = require("./update_schedule_items_times.js");
exports.updateScheduleItemsTimes =
  updateScheduleItemsTimes.updateScheduleItemsTimes;
const updateSingleScheduleItem = require("./update_single_schedule_item.js");
exports.updateSingleScheduleItem =
  updateSingleScheduleItem.updateSingleScheduleItem;
const processVoiceCapture = require("./process_voice_capture.js");
exports.processVoiceCapture = processVoiceCapture.processVoiceCapture;
const replanSchedule = require("./replan_schedule.js");
exports.replanSchedule = replanSchedule.replanSchedule;

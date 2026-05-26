import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/bottom_sheet/schedule_item/schedule_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_schedule_preview_widget.dart' show AISchedulePreviewWidget;
import 'package:flutter/material.dart';

class AISchedulePreviewModel extends FlutterFlowModel<AISchedulePreviewWidget> {
  ///  Local state fields for this component.

  List<TaskStructStruct> dailyPlanTasks = [];
  void addToDailyPlanTasks(TaskStructStruct item) => dailyPlanTasks.add(item);
  void removeFromDailyPlanTasks(TaskStructStruct item) =>
      dailyPlanTasks.remove(item);
  void removeAtIndexFromDailyPlanTasks(int index) =>
      dailyPlanTasks.removeAt(index);
  void insertAtIndexInDailyPlanTasks(int index, TaskStructStruct item) =>
      dailyPlanTasks.insert(index, item);
  void updateDailyPlanTasksAtIndex(
          int index, Function(TaskStructStruct) updateFn) =>
      dailyPlanTasks[index] = updateFn(dailyPlanTasks[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in AI_SchedulePreview widget.
  ScheduleProposalsRecord? resultSchedule;
  // Models for ScheduleItem dynamic component.
  late FlutterFlowDynamicModels<ScheduleItemModel> scheduleItemModels;
  // Stores action output result for [Cloud Function - applyScheduleProposal] action in Button widget.
  ApplyScheduleProposalCloudFunctionCallResponse? responseScheduleProposal;

  @override
  void initState(BuildContext context) {
    scheduleItemModels = FlutterFlowDynamicModels(() => ScheduleItemModel());
  }

  @override
  void dispose() {
    scheduleItemModels.dispose();
  }
}

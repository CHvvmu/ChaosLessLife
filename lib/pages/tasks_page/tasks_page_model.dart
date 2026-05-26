import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/component/task_item/task_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tasks_page_widget.dart' show TasksPageWidget;
import 'package:flutter/material.dart';

class TasksPageModel extends FlutterFlowModel<TasksPageWidget> {
  ///  Local state fields for this page.

  List<TasksRecord> tasksList = [];
  void addToTasksList(TasksRecord item) => tasksList.add(item);
  void removeFromTasksList(TasksRecord item) => tasksList.remove(item);
  void removeAtIndexFromTasksList(int index) => tasksList.removeAt(index);
  void insertAtIndexInTasksList(int index, TasksRecord item) =>
      tasksList.insert(index, item);
  void updateTasksListAtIndex(int index, Function(TasksRecord) updateFn) =>
      tasksList[index] = updateFn(tasksList[index]);

  String? selectedFilter = 'all';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in TasksPage widget.
  List<TasksRecord>? loadedTasks;
  // Stores action output result for [Cloud Function - generateDailyPlan] action in TasksGeneratePlanButton widget.
  GenerateDailyPlanCloudFunctionCallResponse? generateDailyPlanResult;
  // Models for TaskItem.
  late FlutterFlowDynamicModels<TaskItemModel> taskItemModels;

  @override
  void initState(BuildContext context) {
    taskItemModels = FlutterFlowDynamicModels(() => TaskItemModel());
  }

  @override
  void dispose() {
    taskItemModels.dispose();
  }
}

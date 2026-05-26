import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/component/date_pill2/date_pill2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'plan_board_page_widget.dart' show PlanBoardPageWidget;
import 'package:flutter/material.dart';

class PlanBoardPageModel extends FlutterFlowModel<PlanBoardPageWidget> {
  ///  Local state fields for this page.

  int? baseHour = 8;

  /// tasksAvailable
  List<ItemsRecord> tasksSelected = [];
  void addToTasksSelected(ItemsRecord item) => tasksSelected.add(item);
  void removeFromTasksSelected(ItemsRecord item) => tasksSelected.remove(item);
  void removeAtIndexFromTasksSelected(int index) =>
      tasksSelected.removeAt(index);
  void insertAtIndexInTasksSelected(int index, ItemsRecord item) =>
      tasksSelected.insert(index, item);
  void updateTasksSelectedAtIndex(int index, Function(ItemsRecord) updateFn) =>
      tasksSelected[index] = updateFn(tasksSelected[index]);

  List<ItemsRecord> tasksAvailable = [];
  void addToTasksAvailable(ItemsRecord item) => tasksAvailable.add(item);
  void removeFromTasksAvailable(ItemsRecord item) =>
      tasksAvailable.remove(item);
  void removeAtIndexFromTasksAvailable(int index) =>
      tasksAvailable.removeAt(index);
  void insertAtIndexInTasksAvailable(int index, ItemsRecord item) =>
      tasksAvailable.insert(index, item);
  void updateTasksAvailableAtIndex(int index, Function(ItemsRecord) updateFn) =>
      tasksAvailable[index] = updateFn(tasksAvailable[index]);

  ItemsRecord? blockSelected;

  DateTime? selectedDate;

  DocumentReference? selectedSchedule;

  String? itemsJson = '';

  bool? isPlanBoardLoading = true;

  bool? isPlanBoardEmpty = false;

  List<SchedulesRecord> loadedPlanBoardSchedules = [];
  void addToLoadedPlanBoardSchedules(SchedulesRecord item) =>
      loadedPlanBoardSchedules.add(item);
  void removeFromLoadedPlanBoardSchedules(SchedulesRecord item) =>
      loadedPlanBoardSchedules.remove(item);
  void removeAtIndexFromLoadedPlanBoardSchedules(int index) =>
      loadedPlanBoardSchedules.removeAt(index);
  void insertAtIndexInLoadedPlanBoardSchedules(
          int index, SchedulesRecord item) =>
      loadedPlanBoardSchedules.insert(index, item);
  void updateLoadedPlanBoardSchedulesAtIndex(
          int index, Function(SchedulesRecord) updateFn) =>
      loadedPlanBoardSchedules[index] =
          updateFn(loadedPlanBoardSchedules[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PlanBoardPage widget.
  List<SchedulesRecord>? loadedPlanBoardSchedulesQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in PlanBoardPage widget.
  List<ItemsRecord>? loadedPlanBoardItemsQuery;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<SchedulesRecord>? reloadedPlanBoardSchedulesQueryPicker;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<ItemsRecord>? reloadedPlanBoardItemsQueryPicker;
  // Model for DatePill2 component.
  late DatePill2Model datePill2Model1;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<SchedulesRecord>? reloadedPlanBoardSchedulesQueryPill0;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<ItemsRecord>? reloadedPlanBoardItemsQueryPill0;
  // Model for DatePill2 component.
  late DatePill2Model datePill2Model2;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<SchedulesRecord>? reloadedPlanBoardSchedulesQueryPill1;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<ItemsRecord>? reloadedPlanBoardItemsQueryPill1;
  // Model for DatePill2 component.
  late DatePill2Model datePill2Model3;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<SchedulesRecord>? reloadedPlanBoardSchedulesQueryPill2;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<ItemsRecord>? reloadedPlanBoardItemsQueryPill2;
  // Model for DatePill2 component.
  late DatePill2Model datePill2Model4;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<SchedulesRecord>? reloadedPlanBoardSchedulesQueryPill3;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<ItemsRecord>? reloadedPlanBoardItemsQueryPill3;
  // Model for DatePill2 component.
  late DatePill2Model datePill2Model5;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<SchedulesRecord>? reloadedPlanBoardSchedulesQueryPill4;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<ItemsRecord>? reloadedPlanBoardItemsQueryPill4;
  // Model for DatePill2 component.
  late DatePill2Model datePill2Model6;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<SchedulesRecord>? reloadedPlanBoardSchedulesQueryPill5;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<ItemsRecord>? reloadedPlanBoardItemsQueryPill5;
  // Model for DatePill2 component.
  late DatePill2Model datePill2Model7;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<SchedulesRecord>? reloadedPlanBoardSchedulesQueryPill6;
  // Stores action output result for [Firestore Query - Query a collection] action in DatePill2 widget.
  List<ItemsRecord>? reloadedPlanBoardItemsQueryPill6;
  // Stores action output result for [Cloud Function - reorderScheduleItems] action in ScheduleDragList widget.
  ReorderScheduleItemsCloudFunctionCallResponse? cloudFunctionyk4;

  @override
  void initState(BuildContext context) {
    datePill2Model1 = createModel(context, () => DatePill2Model());
    datePill2Model2 = createModel(context, () => DatePill2Model());
    datePill2Model3 = createModel(context, () => DatePill2Model());
    datePill2Model4 = createModel(context, () => DatePill2Model());
    datePill2Model5 = createModel(context, () => DatePill2Model());
    datePill2Model6 = createModel(context, () => DatePill2Model());
    datePill2Model7 = createModel(context, () => DatePill2Model());
  }

  @override
  void dispose() {
    datePill2Model1.dispose();
    datePill2Model2.dispose();
    datePill2Model3.dispose();
    datePill2Model4.dispose();
    datePill2Model5.dispose();
    datePill2Model6.dispose();
    datePill2Model7.dispose();
  }
}

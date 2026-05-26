import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'today_page_widget.dart' show TodayPageWidget;
import 'package:flutter/material.dart';

class TodayPageModel extends FlutterFlowModel<TodayPageWidget> {
  ///  Local state fields for this page.

  List<SchedulesRecord> todaySchedules = [];
  void addToTodaySchedules(SchedulesRecord item) => todaySchedules.add(item);
  void removeFromTodaySchedules(SchedulesRecord item) =>
      todaySchedules.remove(item);
  void removeAtIndexFromTodaySchedules(int index) =>
      todaySchedules.removeAt(index);
  void insertAtIndexInTodaySchedules(int index, SchedulesRecord item) =>
      todaySchedules.insert(index, item);
  void updateTodaySchedulesAtIndex(
          int index, Function(SchedulesRecord) updateFn) =>
      todaySchedules[index] = updateFn(todaySchedules[index]);

  List<ItemsRecord> todayItems = [];
  void addToTodayItems(ItemsRecord item) => todayItems.add(item);
  void removeFromTodayItems(ItemsRecord item) => todayItems.remove(item);
  void removeAtIndexFromTodayItems(int index) => todayItems.removeAt(index);
  void insertAtIndexInTodayItems(int index, ItemsRecord item) =>
      todayItems.insert(index, item);
  void updateTodayItemsAtIndex(int index, Function(ItemsRecord) updateFn) =>
      todayItems[index] = updateFn(todayItems[index]);

  ItemsRecord? selectedExecutionItem;

  String? executionMessage = 'Loading today execution context...';

  DateTime? todayDate;

  DocumentReference? selectedTodaySchedule;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in TodayPage widget.
  List<ItemsRecord>? loadedTodayItemsQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ItemsRecord>? refreshedTodayItemsAfterComplete;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ItemsRecord>? refreshedTodayItemsAfterSnooze;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ItemsRecord>? refreshedTodayItemsAfterReschedule;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inbox_page_widget.dart' show InboxPageWidget;
import 'package:flutter/material.dart';

class InboxPageModel extends FlutterFlowModel<InboxPageWidget> {
  ///  Local state fields for this page.

  List<InboxItemsRecord> inboxList = [];
  void addToInboxList(InboxItemsRecord item) => inboxList.add(item);
  void removeFromInboxList(InboxItemsRecord item) => inboxList.remove(item);
  void removeAtIndexFromInboxList(int index) => inboxList.removeAt(index);
  void insertAtIndexInInboxList(int index, InboxItemsRecord item) =>
      inboxList.insert(index, item);
  void updateInboxListAtIndex(int index, Function(InboxItemsRecord) updateFn) =>
      inboxList[index] = updateFn(inboxList[index]);

  List<TasksSubRecord> draftList = [];
  void addToDraftList(TasksSubRecord item) => draftList.add(item);
  void removeFromDraftList(TasksSubRecord item) => draftList.remove(item);
  void removeAtIndexFromDraftList(int index) => draftList.removeAt(index);
  void insertAtIndexInDraftList(int index, TasksSubRecord item) =>
      draftList.insert(index, item);
  void updateDraftListAtIndex(int index, Function(TasksSubRecord) updateFn) =>
      draftList[index] = updateFn(draftList[index]);

  String? selectedQueue = 'review';

  InboxItemsRecord? selectedInboxItem;

  TasksSubRecord? selectedDraft;

  String? statusMessage = 'Loading review queue...';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in InboxPage widget.
  List<InboxItemsRecord>? inboxPageInboxItemsQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in InboxPage widget.
  List<TasksSubRecord>? inboxPageDraftsQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

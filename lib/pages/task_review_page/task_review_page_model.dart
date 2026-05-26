import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'task_review_page_widget.dart' show TaskReviewPageWidget;
import 'package:flutter/material.dart';

class TaskReviewPageModel extends FlutterFlowModel<TaskReviewPageWidget> {
  ///  Local state fields for this page.

  String? reviewStatus = 'needs_review';

  String? approvalMessage = 'Review the AI draft and decide.';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TasksRecord? createdTask;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

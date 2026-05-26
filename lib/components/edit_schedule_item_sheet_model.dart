import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_schedule_item_sheet_widget.dart' show EditScheduleItemSheetWidget;
import 'package:flutter/material.dart';

class EditScheduleItemSheetModel
    extends FlutterFlowModel<EditScheduleItemSheetWidget> {
  ///  Local state fields for this component.

  DateTime? startTime;

  int? durationMin;

  String title = 'нет';

  bool locked = false;

  String? updatedJson;

  String? recalculatedJson;

  String? workStartIso;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // Stores action output result for [Cloud Function - updateScheduleItemsTimes] action in Button widget.
  UpdateScheduleItemsTimesCloudFunctionCallResponse? updateSchedule;
  // Stores action output result for [Cloud Function - updateSingleScheduleItem] action in Button widget.
  UpdateSingleScheduleItemCloudFunctionCallResponse? cloudFunctioncp6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}

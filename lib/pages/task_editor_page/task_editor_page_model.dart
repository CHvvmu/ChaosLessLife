import '/component/assignee_item/assignee_item_widget.dart';
import '/component/form_label/form_label_widget.dart';
import '/component/selection_chip/selection_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'task_editor_page_widget.dart' show TaskEditorPageWidget;
import 'package:flutter/material.dart';

class TaskEditorPageModel extends FlutterFlowModel<TaskEditorPageWidget> {
  ///  Local state fields for this page.

  DateTime? date;

  DateTime? time;

  String? priority;

  ///  State fields for stateful widgets in this page.

  // Model for FormLabel component.
  late FormLabelModel formLabelModel1;
  // State field(s) for TextField_Title widget.
  FocusNode? textFieldTitleFocusNode;
  TextEditingController? textFieldTitleTextController;
  String? Function(BuildContext, String?)?
      textFieldTitleTextControllerValidator;
  // Model for FormLabel component.
  late FormLabelModel formLabelModel2;
  // State field(s) for TextField_Discription widget.
  FocusNode? textFieldDiscriptionFocusNode;
  TextEditingController? textFieldDiscriptionTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscriptionTextControllerValidator;
  // Model for FormLabel component.
  late FormLabelModel formLabelModel3;
  // Model for SelectionChip component.
  late SelectionChipModel selectionChipModel1;
  // Model for SelectionChip component.
  late SelectionChipModel selectionChipModel2;
  // Model for SelectionChip component.
  late SelectionChipModel selectionChipModel3;
  // Model for FormLabel component.
  late FormLabelModel formLabelModel4;
  DateTime? datePicked;
  // Model for FormLabel component.
  late FormLabelModel formLabelModel5;
  // Model for AssigneeItem component.
  late AssigneeItemModel assigneeItemModel;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    formLabelModel1 = createModel(context, () => FormLabelModel());
    formLabelModel2 = createModel(context, () => FormLabelModel());
    formLabelModel3 = createModel(context, () => FormLabelModel());
    selectionChipModel1 = createModel(context, () => SelectionChipModel());
    selectionChipModel2 = createModel(context, () => SelectionChipModel());
    selectionChipModel3 = createModel(context, () => SelectionChipModel());
    formLabelModel4 = createModel(context, () => FormLabelModel());
    formLabelModel5 = createModel(context, () => FormLabelModel());
    assigneeItemModel = createModel(context, () => AssigneeItemModel());
  }

  @override
  void dispose() {
    formLabelModel1.dispose();
    textFieldTitleFocusNode?.dispose();
    textFieldTitleTextController?.dispose();

    formLabelModel2.dispose();
    textFieldDiscriptionFocusNode?.dispose();
    textFieldDiscriptionTextController?.dispose();

    formLabelModel3.dispose();
    selectionChipModel1.dispose();
    selectionChipModel2.dispose();
    selectionChipModel3.dispose();
    formLabelModel4.dispose();
    formLabelModel5.dispose();
    assigneeItemModel.dispose();
  }
}

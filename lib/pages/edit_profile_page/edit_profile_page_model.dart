import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:flutter/material.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  Local state fields for this page.

  String? editName = '';

  String? editPhone = '';

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataDoo = false;
  FFUploadedFile uploadedLocalFile_uploadDataDoo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataDoo = '';

  // State field(s) for EditNameField widget.
  FocusNode? editNameFieldFocusNode;
  TextEditingController? editNameFieldTextController;
  String? Function(BuildContext, String?)? editNameFieldTextControllerValidator;
  // State field(s) for EditPhoneField widget.
  FocusNode? editPhoneFieldFocusNode;
  TextEditingController? editPhoneFieldTextController;
  String? Function(BuildContext, String?)?
      editPhoneFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editNameFieldFocusNode?.dispose();
    editNameFieldTextController?.dispose();

    editPhoneFieldFocusNode?.dispose();
    editPhoneFieldTextController?.dispose();
  }
}

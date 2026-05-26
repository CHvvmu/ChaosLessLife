import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'voice_capture_page_widget.dart' show VoiceCapturePageWidget;
import 'package:flutter/material.dart';

class VoiceCapturePageModel extends FlutterFlowModel<VoiceCapturePageWidget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  String uploadedAudioUrl = 'ww';

  int recordingSeconds = 0;

  FFUploadedFile? recordedAudioFile1;

  String? captureStage = 'recording';

  String? captureError = '';

  String? captureSessionId = '';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - manageRecording] action in StartRecordingBtn widget.
  String? startRecResult;
  // Stores action output result for [Custom Action - manageRecording] action in StopRecordingBtn widget.
  String? stopRecAudioUrl;
  // Stores action output result for [Custom Action - createCaptureSession] action in StopRecordingBtn widget.
  String? newSessionId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

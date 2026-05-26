import '/component/ai_suggestion/ai_suggestion_widget.dart';
import '/component/transcript_item/transcript_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'call_assistant_widget.dart' show CallAssistantWidget;
import 'package:flutter/material.dart';

class CallAssistantModel extends FlutterFlowModel<CallAssistantWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TranscriptItem component.
  late TranscriptItemModel transcriptItemModel1;
  // Model for TranscriptItem component.
  late TranscriptItemModel transcriptItemModel2;
  // Model for TranscriptItem component.
  late TranscriptItemModel transcriptItemModel3;
  // Model for AiSuggestion component.
  late AiSuggestionModel aiSuggestionModel1;
  // Model for AiSuggestion component.
  late AiSuggestionModel aiSuggestionModel2;
  // Model for AiSuggestion component.
  late AiSuggestionModel aiSuggestionModel3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    transcriptItemModel1 = createModel(context, () => TranscriptItemModel());
    transcriptItemModel2 = createModel(context, () => TranscriptItemModel());
    transcriptItemModel3 = createModel(context, () => TranscriptItemModel());
    aiSuggestionModel1 = createModel(context, () => AiSuggestionModel());
    aiSuggestionModel2 = createModel(context, () => AiSuggestionModel());
    aiSuggestionModel3 = createModel(context, () => AiSuggestionModel());
  }

  @override
  void dispose() {
    transcriptItemModel1.dispose();
    transcriptItemModel2.dispose();
    transcriptItemModel3.dispose();
    aiSuggestionModel1.dispose();
    aiSuggestionModel2.dispose();
    aiSuggestionModel3.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

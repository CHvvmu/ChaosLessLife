import '/component/chat_tab/chat_tab_widget.dart';
import '/component/message_item/message_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a3_a_i_messaging_hub_widget.dart' show A3AIMessagingHubWidget;
import 'package:flutter/material.dart';

class A3AIMessagingHubModel extends FlutterFlowModel<A3AIMessagingHubWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChatTab component.
  late ChatTabModel chatTabModel1;
  // Model for ChatTab component.
  late ChatTabModel chatTabModel2;
  // Model for ChatTab component.
  late ChatTabModel chatTabModel3;
  // Model for ChatTab component.
  late ChatTabModel chatTabModel4;
  // Model for ChatTab component.
  late ChatTabModel chatTabModel5;
  // Model for MessageItem component.
  late MessageItemModel messageItemModel1;
  // Model for MessageItem component.
  late MessageItemModel messageItemModel2;
  // Model for MessageItem component.
  late MessageItemModel messageItemModel3;

  @override
  void initState(BuildContext context) {
    chatTabModel1 = createModel(context, () => ChatTabModel());
    chatTabModel2 = createModel(context, () => ChatTabModel());
    chatTabModel3 = createModel(context, () => ChatTabModel());
    chatTabModel4 = createModel(context, () => ChatTabModel());
    chatTabModel5 = createModel(context, () => ChatTabModel());
    messageItemModel1 = createModel(context, () => MessageItemModel());
    messageItemModel2 = createModel(context, () => MessageItemModel());
    messageItemModel3 = createModel(context, () => MessageItemModel());
  }

  @override
  void dispose() {
    chatTabModel1.dispose();
    chatTabModel2.dispose();
    chatTabModel3.dispose();
    chatTabModel4.dispose();
    chatTabModel5.dispose();
    messageItemModel1.dispose();
    messageItemModel2.dispose();
    messageItemModel3.dispose();
  }
}

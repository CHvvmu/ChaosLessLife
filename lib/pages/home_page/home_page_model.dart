import '/backend/backend.dart';
import '/component/ai_recommendation/ai_recommendation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<InboxItemsRecord> inboxPreviewList = [];
  void addToInboxPreviewList(InboxItemsRecord item) =>
      inboxPreviewList.add(item);
  void removeFromInboxPreviewList(InboxItemsRecord item) =>
      inboxPreviewList.remove(item);
  void removeAtIndexFromInboxPreviewList(int index) =>
      inboxPreviewList.removeAt(index);
  void insertAtIndexInInboxPreviewList(int index, InboxItemsRecord item) =>
      inboxPreviewList.insert(index, item);
  void updateInboxPreviewListAtIndex(
          int index, Function(InboxItemsRecord) updateFn) =>
      inboxPreviewList[index] = updateFn(inboxPreviewList[index]);

  DateTime? homeTodayDate;

  List<ItemsRecord> homeTodayItems = [];
  void addToHomeTodayItems(ItemsRecord item) => homeTodayItems.add(item);
  void removeFromHomeTodayItems(ItemsRecord item) =>
      homeTodayItems.remove(item);
  void removeAtIndexFromHomeTodayItems(int index) =>
      homeTodayItems.removeAt(index);
  void insertAtIndexInHomeTodayItems(int index, ItemsRecord item) =>
      homeTodayItems.insert(index, item);
  void updateHomeTodayItemsAtIndex(int index, Function(ItemsRecord) updateFn) =>
      homeTodayItems[index] = updateFn(homeTodayItems[index]);

  ItemsRecord? homeCurrentItem;

  ItemsRecord? homeNextItem;

  bool? homeHasCurrentItem = false;

  bool? homeHasNextItem = false;

  List<AiRecommendationsRecord> homeAiRecommendations = [];
  void addToHomeAiRecommendations(AiRecommendationsRecord item) =>
      homeAiRecommendations.add(item);
  void removeFromHomeAiRecommendations(AiRecommendationsRecord item) =>
      homeAiRecommendations.remove(item);
  void removeAtIndexFromHomeAiRecommendations(int index) =>
      homeAiRecommendations.removeAt(index);
  void insertAtIndexInHomeAiRecommendations(
          int index, AiRecommendationsRecord item) =>
      homeAiRecommendations.insert(index, item);
  void updateHomeAiRecommendationsAtIndex(
          int index, Function(AiRecommendationsRecord) updateFn) =>
      homeAiRecommendations[index] = updateFn(homeAiRecommendations[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<InboxItemsRecord>? homeInboxPreviewQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<ItemsRecord>? homeTodayItemsQuery;
  // Models for AiRecItem.
  late FlutterFlowDynamicModels<AiRecommendationModel> aiRecItemModels;

  @override
  void initState(BuildContext context) {
    aiRecItemModels = FlutterFlowDynamicModels(() => AiRecommendationModel());
  }

  @override
  void dispose() {
    aiRecItemModels.dispose();
  }
}

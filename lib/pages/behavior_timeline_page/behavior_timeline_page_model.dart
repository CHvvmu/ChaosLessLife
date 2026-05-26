import '/backend/backend.dart';
import '/components/event_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'behavior_timeline_page_widget.dart' show BehaviorTimelinePageWidget;
import 'package:flutter/material.dart';

class BehaviorTimelinePageModel
    extends FlutterFlowModel<BehaviorTimelinePageWidget> {
  ///  Local state fields for this page.

  List<EventsRecord> eventsList = [];
  void addToEventsList(EventsRecord item) => eventsList.add(item);
  void removeFromEventsList(EventsRecord item) => eventsList.remove(item);
  void removeAtIndexFromEventsList(int index) => eventsList.removeAt(index);
  void insertAtIndexInEventsList(int index, EventsRecord item) =>
      eventsList.insert(index, item);
  void updateEventsListAtIndex(int index, Function(EventsRecord) updateFn) =>
      eventsList[index] = updateFn(eventsList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in BehaviorTimelinePage widget.
  List<EventsRecord>? behaviorTimelineEventsQuery;
  // Models for BehaviorTimelineEventCard.
  late FlutterFlowDynamicModels<EventCardModel> behaviorTimelineEventCardModels;

  @override
  void initState(BuildContext context) {
    behaviorTimelineEventCardModels =
        FlutterFlowDynamicModels(() => EventCardModel());
  }

  @override
  void dispose() {
    behaviorTimelineEventCardModels.dispose();
  }
}

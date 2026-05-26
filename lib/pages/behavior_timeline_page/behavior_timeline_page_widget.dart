import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/event_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'behavior_timeline_page_model.dart';
export 'behavior_timeline_page_model.dart';

/// Read-only timeline of user behavior events from Firestore.
class BehaviorTimelinePageWidget extends StatefulWidget {
  const BehaviorTimelinePageWidget({super.key});

  static String routeName = 'BehaviorTimelinePage';
  static String routePath = '/behavior-timeline';

  @override
  State<BehaviorTimelinePageWidget> createState() =>
      _BehaviorTimelinePageWidgetState();
}

class _BehaviorTimelinePageWidgetState
    extends State<BehaviorTimelinePageWidget> {
  late BehaviorTimelinePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BehaviorTimelinePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.behaviorTimelineEventsQuery = await queryEventsRecordOnce(
        queryBuilder: (eventsRecord) => eventsRecord
            .where(
              'userId',
              isEqualTo: currentUserUid,
            )
            .orderBy('timestamp', descending: true),
        limit: 100,
      );
      _model.eventsList =
          _model.behaviorTimelineEventsQuery!.toList().cast<EventsRecord>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(HomePageWidget.routeName);
                      },
                      text: FFLocalizations.of(context).getText(
                        '78bnruoz' /* На главную */,
                      ),
                      options: FFButtonOptions(
                        height: 42.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'ahko1ubg' /* История действий */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
                Expanded(
                  flex: 1,
                  child: Builder(
                    builder: (context) {
                      final eventsListItem = _model.eventsList.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: eventsListItem.length,
                        separatorBuilder: (_, __) => SizedBox(height: 8.0),
                        itemBuilder: (context, eventsListItemIndex) {
                          final eventsListItemItem =
                              eventsListItem[eventsListItemIndex];
                          return wrapWithModel(
                            model:
                                _model.behaviorTimelineEventCardModels.getModel(
                              eventsListItemIndex.toString(),
                              eventsListItemIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: EventCardWidget(
                              key: Key(
                                'Key81o_${eventsListItemIndex.toString()}',
                              ),
                              dateLabel: '',
                              eventLabel: eventsListItemItem.type,
                              eventType: eventsListItemItem.type,
                              payloadStatus: eventsListItemItem.payload.status,
                              payloadTitle: eventsListItemItem.payload.title,
                              relativeTime: eventsListItemItem.timestamp,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}

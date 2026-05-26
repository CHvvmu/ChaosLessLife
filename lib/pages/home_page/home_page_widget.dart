import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/ai_recommendation/ai_recommendation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

/// Control center for voice capture, focus, schedule, inbox, and planning.
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/home';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.homeTodayDate = getCurrentTimestamp;
      safeSetState(() {});
      _model.homeInboxPreviewQuery = await queryInboxItemsRecordOnce(
        queryBuilder: (inboxItemsRecord) => inboxItemsRecord.where(
          'userId',
          isEqualTo: currentUserUid,
        ),
        limit: 5,
      );
      _model.inboxPreviewList =
          _model.homeInboxPreviewQuery!.toList().cast<InboxItemsRecord>();
      safeSetState(() {});
      _model.homeTodayItemsQuery = await queryItemsRecordOnce(
        queryBuilder: (itemsRecord) => itemsRecord
            .where(
              'start',
              isGreaterThanOrEqualTo:
                  functions.planBoardDayStart(_model.homeTodayDate),
            )
            .where(
              'start',
              isLessThan: functions.planBoardNextDayStart(_model.homeTodayDate),
            )
            .orderBy('start'),
        limit: 50,
      );
      _model.homeTodayItems =
          _model.homeTodayItemsQuery!.toList().cast<ItemsRecord>();
      safeSetState(() {});
      if (functions.planBoardHasItems(_model.homeTodayItemsQuery?.toList())!) {
        _model.homeCurrentItem = functions.selectPrimaryTodayItem(
            _model.homeTodayItemsQuery?.toList(), getCurrentTimestamp);
        safeSetState(() {});
        _model.homeHasCurrentItem = true;
        safeSetState(() {});
        _model.homeNextItem = functions.selectNextTodayItem(
            _model.homeTodayItemsQuery?.toList(), getCurrentTimestamp);
        safeSetState(() {});
        if (functions.homeItemPresent(_model.homeNextItem)!) {
          _model.homeHasNextItem = true;
          safeSetState(() {});
        } else {
          _model.homeHasNextItem = false;
          safeSetState(() {});
        }
      } else {
        _model.homeCurrentItem = null;
        safeSetState(() {});
        _model.homeHasCurrentItem = false;
        safeSetState(() {});
        _model.homeNextItem = null;
        safeSetState(() {});
        _model.homeHasNextItem = false;
        safeSetState(() {});
      }
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
          child: FloatingActionButton(
            onPressed: () async {
              context.pushNamed(VoiceCapturePageWidget.routeName);
            },
            backgroundColor: FlutterFlowTheme.of(context).accent1,
            elevation: 8.0,
            child: Icon(
              Icons.mic,
              color: Colors.black,
              size: 36.0,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'lzz0ralf' /* Home */,
                          ),
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'zbu8ub0o' /* Центр управления на сегодня */,
                          ),
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.dmSans(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.settings,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(A5UserSettingsWidget.routeName);
                      },
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ossx8j89' /* Быстрый голосовой захват */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'p7v02ovd' /* Запишите мысль, задачу или зам... */,
                                  ),
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                            Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.mic,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 22.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                      VoiceCapturePageWidget.routeName);
                                },
                                text: FFLocalizations.of(context).getText(
                                  'x47qqklf' /* Записать */,
                                ),
                                icon: Icon(
                                  Icons.mic,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 44.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context
                                      .pushNamed(CallAssistantWidget.routeName);
                                },
                                text: FFLocalizations.of(context).getText(
                                  '9whx0tj1' /* Спросить ИИ */,
                                ),
                                icon: Icon(
                                  Icons.auto_awesome,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 44.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: Colors.white,
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
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ddo8d9hi' /* Текущий фокус */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.nunito(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Icon(
                                    Icons.center_focus_strong,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                              Text(
                                functions
                                    .homeItemTitle(_model.homeCurrentItem)!,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.nunito(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                functions.homeItemDesc(_model.homeCurrentItem)!,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '6dlskd74' /* Следующий блок */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.nunito(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Icon(
                                    Icons.event,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                              Text(
                                functions.homeNextBlockLabel(
                                    _model.homeNextItem?.start,
                                    _model.homeNextItem?.title)!,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.nunito(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                functions.homeItemDesc(_model.homeNextItem)!,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context
                                      .pushNamed(PlanBoardPageWidget.routeName);
                                },
                                text: FFLocalizations.of(context).getText(
                                  'wlzx53y5' /* Открыть */,
                                ),
                                options: FFButtonOptions(
                                  height: 36.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
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
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'kf0j1c2h' /* Обзор входящих */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.dmSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(InboxPageWidget.routeName);
                              },
                              text: FFLocalizations.of(context).getText(
                                'lx4w0mqh' /* Открыть входящие */,
                              ),
                              options: FFButtonOptions(
                                height: 36.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) {
                            final inboxPreviewListItem =
                                _model.inboxPreviewList.toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: inboxPreviewListItem.length,
                              itemBuilder:
                                  (context, inboxPreviewListItemIndex) {
                                final inboxPreviewListItemItem =
                                    inboxPreviewListItem[
                                        inboxPreviewListItemIndex];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          inboxPreviewListItemItem.title,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          inboxPreviewListItemItem.text,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.dmSans(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Container(
                          width: 1.0,
                          height: 1.0,
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '6mkf3rey' /* Рекомендации ИИ */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.dmSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                        Builder(
                          builder: (context) {
                            final homeAiRecommendation =
                                _model.homeAiRecommendations.toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: homeAiRecommendation.length,
                              itemBuilder:
                                  (context, homeAiRecommendationIndex) {
                                final homeAiRecommendationItem =
                                    homeAiRecommendation[
                                        homeAiRecommendationIndex];
                                return wrapWithModel(
                                  model: _model.aiRecItemModels.getModel(
                                    homeAiRecommendationIndex.toString(),
                                    homeAiRecommendationIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: AiRecommendationWidget(
                                    key: Key(
                                      'Keyoqa_${homeAiRecommendationIndex.toString()}',
                                    ),
                                    text: homeAiRecommendationItem.text,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Container(
                          width: 1.0,
                          height: 1.0,
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(A3AIMessagingHubWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            'p6ypopz5' /* Проверить рекомендации */,
                          ),
                          icon: Icon(
                            Icons.auto_awesome,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.view_timeline,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 28.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'xvknxsiv' /* Панель планирования */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'vvxxpidw' /* Откройте календарь, задачи и б... */,
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(TodayPageWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            'bza9f2o0' /* Сегодня */,
                          ),
                          options: FFButtonOptions(
                            width: 96.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(TasksPageWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            '7m7v877o' /* Задачи */,
                          ),
                          icon: Icon(
                            Icons.checklist,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 42.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconColor: Colors.white,
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: GoogleFonts.dmSans(
                              color: Colors.white,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(CallAssistantWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            '6lxkyi8q' /* AI */,
                          ),
                          icon: Icon(
                            Icons.smart_toy,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 42.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconColor: Colors.white,
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: GoogleFonts.dmSans(
                              color: Colors.white,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'today_page_model.dart';
export 'today_page_model.dart';

/// Minimal execution entry point over the existing daily schedule items
/// source of truth.
class TodayPageWidget extends StatefulWidget {
  const TodayPageWidget({super.key});

  static String routeName = 'TodayPage';
  static String routePath = '/today';

  @override
  State<TodayPageWidget> createState() => _TodayPageWidgetState();
}

class _TodayPageWidgetState extends State<TodayPageWidget> {
  late TodayPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodayPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.todayDate = getCurrentTimestamp;
      safeSetState(() {});
      _model.executionMessage = 'Загрузка...';
      safeSetState(() {});
      _model.loadedTodayItemsQuery = await queryItemsRecordOnce(
        queryBuilder: (itemsRecord) => itemsRecord
            .where(
              'start',
              isGreaterThanOrEqualTo:
                  functions.planBoardDayStart(_model.todayDate),
            )
            .where(
              'start',
              isLessThan: functions.planBoardNextDayStart(_model.todayDate),
            )
            .orderBy('start'),
        limit: 50,
      );
      _model.todayItems =
          _model.loadedTodayItemsQuery!.toList().cast<ItemsRecord>();
      safeSetState(() {});
      if (functions
          .planBoardHasItems(_model.loadedTodayItemsQuery?.toList())!) {
        _model.selectedExecutionItem = functions.selectPrimaryTodayItem(
            _model.loadedTodayItemsQuery?.toList(), getCurrentTimestamp);
        safeSetState(() {});
        _model.executionMessage = 'Контекст выполнения загружен.';
        safeSetState(() {});
      } else {
        _model.selectedExecutionItem = null;
        safeSetState(() {});
        _model.executionMessage = 'Нет задач на сегодня.';
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
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(HomePageWidget.routeName);
                      },
                      text: FFLocalizations.of(context).getText(
                        '8gjb6zxb' /* На главную */,
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
                        'dhv711nm' /* Сегодня */,
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
                  ].divide(SizedBox(width: 50.0)),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'zw1bamno' /* Контекст выполнения */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
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
                  valueOrDefault<String>(
                    _model.executionMessage,
                    'Сообщение об исполнении',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            't48w5xwv' /* Текущий / следующий слот */,
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
                        Text(
                          valueOrDefault<String>(
                            _model.selectedExecutionItem?.title,
                            'Название',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.selectedExecutionItem?.description,
                            'Описание',
                          ),
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
                        ),
                        Text(
                          functions.todayStatusLine(
                              _model.selectedExecutionItem?.status)!,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.nunito(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          functions.todayTimeLine(
                              _model.selectedExecutionItem?.start,
                              _model.selectedExecutionItem?.end)!,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.nunito(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'k16sk7mw' /* Рекомендуемое действие: заверш... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.dmSans(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Builder(
                    builder: (context) {
                      final todayItem = _model.todayItems.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: todayItem.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, todayItemIndex) {
                          final todayItemItem = todayItem[todayItemIndex];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 2.0,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    todayItemItem.title,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                                  ),
                                  Text(
                                    todayItemItem.description,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.dmSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    functions
                                        .todayStatusLine(todayItemItem.status)!,
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
                                  Text(
                                    functions.todayTimeLine(todayItemItem.start,
                                        todayItemItem.end)!,
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
                                  Text(
                                    '',
                                    style: TextStyle(),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await todayItemItem.reference
                                              .update(createItemsRecordData(
                                            status: 'completed',
                                          ));
                                          _model.refreshedTodayItemsAfterComplete =
                                              await queryItemsRecordOnce(
                                            limit: 20,
                                          );
                                          _model.todayItems = _model
                                              .refreshedTodayItemsAfterComplete!
                                              .toList()
                                              .cast<ItemsRecord>();
                                          safeSetState(() {});
                                          _model.selectedExecutionItem =
                                              functions.selectPrimaryTodayItem(
                                                  _model
                                                      .refreshedTodayItemsAfterComplete
                                                      ?.toList(),
                                                  getCurrentTimestamp);
                                          safeSetState(() {});
                                          _model.executionMessage =
                                              'Задача отмечена завершённой.';
                                          safeSetState(() {});
                                          await actions.completeTodayItem(
                                            functions.todayItemRefPath(
                                                todayItemItem),
                                          );

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'chu5d4a0' /* Завершить */,
                                        ),
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await todayItemItem.reference
                                              .update(createItemsRecordData(
                                            status: 'snoozed',
                                          ));
                                          _model.refreshedTodayItemsAfterSnooze =
                                              await queryItemsRecordOnce(
                                            limit: 20,
                                          );
                                          _model.todayItems = _model
                                              .refreshedTodayItemsAfterSnooze!
                                              .toList()
                                              .cast<ItemsRecord>();
                                          safeSetState(() {});
                                          _model.selectedExecutionItem =
                                              functions.selectPrimaryTodayItem(
                                                  _model
                                                      .refreshedTodayItemsAfterSnooze
                                                      ?.toList(),
                                                  getCurrentTimestamp);
                                          safeSetState(() {});
                                          _model.executionMessage =
                                              'Задача отложена на следующий проход.';
                                          safeSetState(() {});
                                          await actions.snoozeTodayItem(
                                            functions.todayItemRefPath(
                                                todayItemItem),
                                          );

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'ub3wo2zp' /* Отложить */,
                                        ),
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await todayItemItem.reference
                                              .update(createItemsRecordData(
                                            status: 'needs_reschedule',
                                          ));
                                          _model.refreshedTodayItemsAfterReschedule =
                                              await queryItemsRecordOnce(
                                            limit: 20,
                                          );
                                          _model.todayItems = _model
                                              .refreshedTodayItemsAfterReschedule!
                                              .toList()
                                              .cast<ItemsRecord>();
                                          safeSetState(() {});
                                          _model.selectedExecutionItem =
                                              functions.selectPrimaryTodayItem(
                                                  _model
                                                      .refreshedTodayItemsAfterReschedule
                                                      ?.toList(),
                                                  getCurrentTimestamp);
                                          safeSetState(() {});
                                          _model.executionMessage =
                                              'Задача отправлена на перепланирование.';
                                          safeSetState(() {});

                                          context.pushNamed(
                                              PlanBoardPageWidget.routeName);

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'zp30dmwx' /* Изменить */,
                                        ),
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
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

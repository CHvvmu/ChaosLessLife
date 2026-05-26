import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/component/date_pill2/date_pill2_widget.dart';
import '/components/edit_schedule_item_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'plan_board_page_model.dart';
export 'plan_board_page_model.dart';

/// Supports realistic day planning with schedule blocks and task allocation.
class PlanBoardPageWidget extends StatefulWidget {
  const PlanBoardPageWidget({super.key});

  static String routeName = 'PlanBoardPage';
  static String routePath = '/plan-board';

  @override
  State<PlanBoardPageWidget> createState() => _PlanBoardPageWidgetState();
}

class _PlanBoardPageWidgetState extends State<PlanBoardPageWidget> {
  late PlanBoardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanBoardPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedDate = getCurrentTimestamp;
      safeSetState(() {});
      _model.isPlanBoardLoading = true;
      safeSetState(() {});
      _model.isPlanBoardEmpty = false;
      safeSetState(() {});
      _model.selectedSchedule = null;
      safeSetState(() {});
      _model.loadedPlanBoardSchedules = [];
      safeSetState(() {});
      _model.tasksAvailable = [];
      safeSetState(() {});
      _model.loadedPlanBoardSchedulesQuery = await querySchedulesRecordOnce(
        queryBuilder: (schedulesRecord) => schedulesRecord
            .where(
              'userId',
              isEqualTo: currentUserUid,
            )
            .orderBy('date'),
        limit: 1,
      );
      _model.loadedPlanBoardSchedules = _model.loadedPlanBoardSchedulesQuery!
          .toList()
          .cast<SchedulesRecord>();
      safeSetState(() {});
      if (functions.planBoardHasSchedules(
          _model.loadedPlanBoardSchedulesQuery?.toList())!) {
        _model.selectedSchedule = functions.planBoardFirstScheduleRef(
            _model.loadedPlanBoardSchedulesQuery?.toList());
        safeSetState(() {});
        _model.loadedPlanBoardItemsQuery = await queryItemsRecordOnce(
          parent: _model.selectedSchedule,
          queryBuilder: (itemsRecord) => itemsRecord.orderBy('order'),
          limit: 50,
        );
        _model.tasksAvailable =
            _model.loadedPlanBoardItemsQuery!.toList().cast<ItemsRecord>();
        safeSetState(() {});
        _model.isPlanBoardEmpty = !functions
            .planBoardHasItems(_model.loadedPlanBoardItemsQuery?.toList())!;
        safeSetState(() {});
        _model.isPlanBoardLoading = false;
        safeSetState(() {});
      } else {
        _model.selectedSchedule = null;
        safeSetState(() {});
        _model.tasksAvailable = [];
        safeSetState(() {});
        _model.isPlanBoardEmpty = true;
        safeSetState(() {});
        _model.isPlanBoardLoading = false;
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
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
        child: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(VoiceCapturePageWidget.routeName);
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          child: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).primaryBackground,
            size: 24.0,
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).divider,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).divider,
                            borderRadius: 4.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                functions
                                    .planBoardMonthYear(_model.selectedDate)!,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                      lineHeight: 1.2,
                                    ),
                              ),
                              Text(
                                functions
                                    .planBoardDayHeadline(_model.selectedDate)!,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                      lineHeight: 1.3,
                                    ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).divider,
                        borderRadius: 4.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.calendar_today_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (kIsWeb) {
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate:
                                  (_model.selectedDate ?? DateTime.now()),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2050),
                              builder: (context, child) {
                                return wrapInMaterialDatePickerTheme(
                                  context,
                                  child!,
                                  headerBackgroundColor: Color(0x00000000),
                                  headerForegroundColor: Color(0x00000000),
                                  headerTextStyle: TextStyle(),
                                  pickerBackgroundColor: Color(0x00000000),
                                  pickerForegroundColor: Color(0x00000000),
                                  selectedDateTimeBackgroundColor:
                                      Color(0x00000000),
                                  selectedDateTimeForegroundColor:
                                      Color(0x00000000),
                                  actionButtonForegroundColor:
                                      Color(0x00000000),
                                  iconSize: 24,
                                );
                              },
                            );

                            if (_datePickedDate != null) {
                              safeSetState(() {
                                _model.datePicked = DateTime(
                                  _datePickedDate.year,
                                  _datePickedDate.month,
                                  _datePickedDate.day,
                                );
                              });
                            } else if (_model.datePicked != null) {
                              safeSetState(() {
                                _model.datePicked = _model.selectedDate;
                              });
                            }
                          } else {
                            await DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) {
                                safeSetState(() {
                                  _model.datePicked = date;
                                });
                              },
                              currentTime: _model.selectedDate!,
                              minTime: DateTime(0, 0, 0),
                              locale: LocaleType.values.firstWhere(
                                (l) =>
                                    l.name ==
                                    FFLocalizations.of(context).languageCode,
                                orElse: () => LocaleType.en,
                              ),
                            );
                          }

                          _model.selectedDate = _model.datePicked;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = true;
                          safeSetState(() {});
                          _model.isPlanBoardEmpty = false;
                          safeSetState(() {});
                          _model.loadedPlanBoardSchedules = [];
                          safeSetState(() {});
                          _model.selectedSchedule = null;
                          safeSetState(() {});
                          _model.tasksAvailable = [];
                          safeSetState(() {});
                          _model.reloadedPlanBoardSchedulesQueryPicker =
                              await querySchedulesRecordOnce(
                            limit: 1,
                          );
                          _model.loadedPlanBoardSchedules = _model
                              .reloadedPlanBoardSchedulesQueryPicker!
                              .toList()
                              .cast<SchedulesRecord>();
                          safeSetState(() {});
                          if (functions.planBoardHasSchedules(_model
                              .reloadedPlanBoardSchedulesQueryPicker
                              ?.toList())!) {
                            _model.selectedSchedule =
                                functions.planBoardFirstScheduleRef(_model
                                    .reloadedPlanBoardSchedulesQueryPicker
                                    ?.toList());
                            safeSetState(() {});
                            _model.reloadedPlanBoardItemsQueryPicker =
                                await queryItemsRecordOnce(
                              limit: 50,
                            );
                            _model.tasksAvailable = _model
                                .reloadedPlanBoardItemsQueryPicker!
                                .toList()
                                .cast<ItemsRecord>();
                            safeSetState(() {});
                            _model.isPlanBoardEmpty =
                                !functions.planBoardHasItems(_model
                                    .reloadedPlanBoardItemsQueryPicker
                                    ?.toList())!;
                            safeSetState(() {});
                            _model.isPlanBoardLoading = false;
                            safeSetState(() {});
                          } else {
                            _model.selectedSchedule = null;
                            safeSetState(() {});
                            _model.tasksAvailable = [];
                            safeSetState(() {});
                            _model.isPlanBoardEmpty = true;
                            safeSetState(() {});
                            _model.isPlanBoardLoading = false;
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedDate =
                            functions.planBoardAddDays(_model.selectedDate, -3);
                        safeSetState(() {});
                        _model.isPlanBoardLoading = true;
                        safeSetState(() {});
                        _model.isPlanBoardEmpty = false;
                        safeSetState(() {});
                        _model.loadedPlanBoardSchedules = [];
                        safeSetState(() {});
                        _model.selectedSchedule = null;
                        safeSetState(() {});
                        _model.tasksAvailable = [];
                        safeSetState(() {});
                        _model.reloadedPlanBoardSchedulesQueryPill0 =
                            await querySchedulesRecordOnce(
                          limit: 1,
                        );
                        _model.loadedPlanBoardSchedules = _model
                            .reloadedPlanBoardSchedulesQueryPill0!
                            .toList()
                            .cast<SchedulesRecord>();
                        safeSetState(() {});
                        if (functions.planBoardHasSchedules(_model
                            .reloadedPlanBoardSchedulesQueryPill0
                            ?.toList())!) {
                          _model.selectedSchedule =
                              functions.planBoardFirstScheduleRef(_model
                                  .reloadedPlanBoardSchedulesQueryPill0
                                  ?.toList());
                          safeSetState(() {});
                          _model.reloadedPlanBoardItemsQueryPill0 =
                              await queryItemsRecordOnce(
                            limit: 50,
                          );
                          _model.tasksAvailable = _model
                              .reloadedPlanBoardItemsQueryPill0!
                              .toList()
                              .cast<ItemsRecord>();
                          safeSetState(() {});
                          _model.isPlanBoardEmpty =
                              !functions.planBoardHasItems(_model
                                  .reloadedPlanBoardItemsQueryPill0
                                  ?.toList())!;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        } else {
                          _model.selectedSchedule = null;
                          safeSetState(() {});
                          _model.tasksAvailable = [];
                          safeSetState(() {});
                          _model.isPlanBoardEmpty = true;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.datePill2Model1,
                        updateCallback: () => safeSetState(() {}),
                        child: DatePill2Widget(
                          selected: false,
                          dayName: functions.planBoardWeekdayShort(functions
                              .planBoardAddDays(_model.selectedDate, -3)),
                          dayNumber: functions.planBoardDayNumber(functions
                              .planBoardAddDays(_model.selectedDate, -3)),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedDate =
                            functions.planBoardAddDays(_model.selectedDate, -2);
                        safeSetState(() {});
                        _model.isPlanBoardLoading = true;
                        safeSetState(() {});
                        _model.isPlanBoardEmpty = false;
                        safeSetState(() {});
                        _model.loadedPlanBoardSchedules = [];
                        safeSetState(() {});
                        _model.selectedSchedule = null;
                        safeSetState(() {});
                        _model.tasksAvailable = [];
                        safeSetState(() {});
                        _model.reloadedPlanBoardSchedulesQueryPill1 =
                            await querySchedulesRecordOnce(
                          limit: 1,
                        );
                        _model.loadedPlanBoardSchedules = _model
                            .reloadedPlanBoardSchedulesQueryPill1!
                            .toList()
                            .cast<SchedulesRecord>();
                        safeSetState(() {});
                        if (functions.planBoardHasSchedules(_model
                            .reloadedPlanBoardSchedulesQueryPill1
                            ?.toList())!) {
                          _model.selectedSchedule =
                              functions.planBoardFirstScheduleRef(_model
                                  .reloadedPlanBoardSchedulesQueryPill1
                                  ?.toList());
                          safeSetState(() {});
                          _model.reloadedPlanBoardItemsQueryPill1 =
                              await queryItemsRecordOnce(
                            limit: 50,
                          );
                          _model.tasksAvailable = _model
                              .reloadedPlanBoardItemsQueryPill1!
                              .toList()
                              .cast<ItemsRecord>();
                          safeSetState(() {});
                          _model.isPlanBoardEmpty =
                              !functions.planBoardHasItems(_model
                                  .reloadedPlanBoardItemsQueryPill1
                                  ?.toList())!;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        } else {
                          _model.selectedSchedule = null;
                          safeSetState(() {});
                          _model.tasksAvailable = [];
                          safeSetState(() {});
                          _model.isPlanBoardEmpty = true;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.datePill2Model2,
                        updateCallback: () => safeSetState(() {}),
                        child: DatePill2Widget(
                          selected: false,
                          dayName: functions.planBoardWeekdayShort(functions
                              .planBoardAddDays(_model.selectedDate, -2)),
                          dayNumber: functions.planBoardDayNumber(functions
                              .planBoardAddDays(_model.selectedDate, -2)),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedDate =
                            functions.planBoardAddDays(_model.selectedDate, -1);
                        safeSetState(() {});
                        _model.isPlanBoardLoading = true;
                        safeSetState(() {});
                        _model.isPlanBoardEmpty = false;
                        safeSetState(() {});
                        _model.loadedPlanBoardSchedules = [];
                        safeSetState(() {});
                        _model.selectedSchedule = null;
                        safeSetState(() {});
                        _model.tasksAvailable = [];
                        safeSetState(() {});
                        _model.reloadedPlanBoardSchedulesQueryPill2 =
                            await querySchedulesRecordOnce(
                          limit: 1,
                        );
                        _model.loadedPlanBoardSchedules = _model
                            .reloadedPlanBoardSchedulesQueryPill2!
                            .toList()
                            .cast<SchedulesRecord>();
                        safeSetState(() {});
                        if (functions.planBoardHasSchedules(_model
                            .reloadedPlanBoardSchedulesQueryPill2
                            ?.toList())!) {
                          _model.selectedSchedule =
                              functions.planBoardFirstScheduleRef(_model
                                  .reloadedPlanBoardSchedulesQueryPill2
                                  ?.toList());
                          safeSetState(() {});
                          _model.reloadedPlanBoardItemsQueryPill2 =
                              await queryItemsRecordOnce(
                            limit: 50,
                          );
                          _model.tasksAvailable = _model
                              .reloadedPlanBoardItemsQueryPill2!
                              .toList()
                              .cast<ItemsRecord>();
                          safeSetState(() {});
                          _model.isPlanBoardEmpty =
                              !functions.planBoardHasItems(_model
                                  .reloadedPlanBoardItemsQueryPill2
                                  ?.toList())!;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        } else {
                          _model.selectedSchedule = null;
                          safeSetState(() {});
                          _model.tasksAvailable = [];
                          safeSetState(() {});
                          _model.isPlanBoardEmpty = true;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.datePill2Model3,
                        updateCallback: () => safeSetState(() {}),
                        child: DatePill2Widget(
                          selected: false,
                          dayName: functions.planBoardWeekdayShort(functions
                              .planBoardAddDays(_model.selectedDate, -1)),
                          dayNumber: functions.planBoardDayNumber(functions
                              .planBoardAddDays(_model.selectedDate, -1)),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedDate =
                            functions.planBoardAddDays(_model.selectedDate, 0);
                        safeSetState(() {});
                        _model.isPlanBoardLoading = true;
                        safeSetState(() {});
                        _model.isPlanBoardEmpty = false;
                        safeSetState(() {});
                        _model.loadedPlanBoardSchedules = [];
                        safeSetState(() {});
                        _model.selectedSchedule = null;
                        safeSetState(() {});
                        _model.tasksAvailable = [];
                        safeSetState(() {});
                        _model.reloadedPlanBoardSchedulesQueryPill3 =
                            await querySchedulesRecordOnce(
                          limit: 1,
                        );
                        _model.loadedPlanBoardSchedules = _model
                            .reloadedPlanBoardSchedulesQueryPill3!
                            .toList()
                            .cast<SchedulesRecord>();
                        safeSetState(() {});
                        if (functions.planBoardHasSchedules(_model
                            .reloadedPlanBoardSchedulesQueryPill3
                            ?.toList())!) {
                          _model.selectedSchedule =
                              functions.planBoardFirstScheduleRef(_model
                                  .reloadedPlanBoardSchedulesQueryPill3
                                  ?.toList());
                          safeSetState(() {});
                          _model.reloadedPlanBoardItemsQueryPill3 =
                              await queryItemsRecordOnce(
                            limit: 50,
                          );
                          _model.tasksAvailable = _model
                              .reloadedPlanBoardItemsQueryPill3!
                              .toList()
                              .cast<ItemsRecord>();
                          safeSetState(() {});
                          _model.isPlanBoardEmpty =
                              !functions.planBoardHasItems(_model
                                  .reloadedPlanBoardItemsQueryPill3
                                  ?.toList())!;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        } else {
                          _model.selectedSchedule = null;
                          safeSetState(() {});
                          _model.tasksAvailable = [];
                          safeSetState(() {});
                          _model.isPlanBoardEmpty = true;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.datePill2Model4,
                        updateCallback: () => safeSetState(() {}),
                        child: DatePill2Widget(
                          selected: true,
                          dayName: functions.planBoardWeekdayShort(functions
                              .planBoardAddDays(_model.selectedDate, 0)),
                          dayNumber: functions.planBoardDayNumber(functions
                              .planBoardAddDays(_model.selectedDate, 0)),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedDate =
                            functions.planBoardAddDays(_model.selectedDate, 1);
                        safeSetState(() {});
                        _model.isPlanBoardLoading = true;
                        safeSetState(() {});
                        _model.isPlanBoardEmpty = false;
                        safeSetState(() {});
                        _model.loadedPlanBoardSchedules = [];
                        safeSetState(() {});
                        _model.selectedSchedule = null;
                        safeSetState(() {});
                        _model.tasksAvailable = [];
                        safeSetState(() {});
                        _model.reloadedPlanBoardSchedulesQueryPill4 =
                            await querySchedulesRecordOnce(
                          limit: 1,
                        );
                        _model.loadedPlanBoardSchedules = _model
                            .reloadedPlanBoardSchedulesQueryPill4!
                            .toList()
                            .cast<SchedulesRecord>();
                        safeSetState(() {});
                        if (functions.planBoardHasSchedules(_model
                            .reloadedPlanBoardSchedulesQueryPill4
                            ?.toList())!) {
                          _model.selectedSchedule =
                              functions.planBoardFirstScheduleRef(_model
                                  .reloadedPlanBoardSchedulesQueryPill4
                                  ?.toList());
                          safeSetState(() {});
                          _model.reloadedPlanBoardItemsQueryPill4 =
                              await queryItemsRecordOnce(
                            limit: 50,
                          );
                          _model.tasksAvailable = _model
                              .reloadedPlanBoardItemsQueryPill4!
                              .toList()
                              .cast<ItemsRecord>();
                          safeSetState(() {});
                          _model.isPlanBoardEmpty =
                              !functions.planBoardHasItems(_model
                                  .reloadedPlanBoardItemsQueryPill4
                                  ?.toList())!;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        } else {
                          _model.selectedSchedule = null;
                          safeSetState(() {});
                          _model.tasksAvailable = [];
                          safeSetState(() {});
                          _model.isPlanBoardEmpty = true;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.datePill2Model5,
                        updateCallback: () => safeSetState(() {}),
                        child: DatePill2Widget(
                          selected: false,
                          dayName: functions.planBoardWeekdayShort(functions
                              .planBoardAddDays(_model.selectedDate, 1)),
                          dayNumber: functions.planBoardDayNumber(functions
                              .planBoardAddDays(_model.selectedDate, 1)),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedDate =
                            functions.planBoardAddDays(_model.selectedDate, 2);
                        safeSetState(() {});
                        _model.isPlanBoardLoading = true;
                        safeSetState(() {});
                        _model.isPlanBoardEmpty = false;
                        safeSetState(() {});
                        _model.loadedPlanBoardSchedules = [];
                        safeSetState(() {});
                        _model.selectedSchedule = null;
                        safeSetState(() {});
                        _model.tasksAvailable = [];
                        safeSetState(() {});
                        _model.reloadedPlanBoardSchedulesQueryPill5 =
                            await querySchedulesRecordOnce(
                          limit: 1,
                        );
                        _model.loadedPlanBoardSchedules = _model
                            .reloadedPlanBoardSchedulesQueryPill5!
                            .toList()
                            .cast<SchedulesRecord>();
                        safeSetState(() {});
                        if (functions.planBoardHasSchedules(_model
                            .reloadedPlanBoardSchedulesQueryPill5
                            ?.toList())!) {
                          _model.selectedSchedule =
                              functions.planBoardFirstScheduleRef(_model
                                  .reloadedPlanBoardSchedulesQueryPill5
                                  ?.toList());
                          safeSetState(() {});
                          _model.reloadedPlanBoardItemsQueryPill5 =
                              await queryItemsRecordOnce(
                            limit: 50,
                          );
                          _model.tasksAvailable = _model
                              .reloadedPlanBoardItemsQueryPill5!
                              .toList()
                              .cast<ItemsRecord>();
                          safeSetState(() {});
                          _model.isPlanBoardEmpty =
                              !functions.planBoardHasItems(_model
                                  .reloadedPlanBoardItemsQueryPill5
                                  ?.toList())!;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        } else {
                          _model.selectedSchedule = null;
                          safeSetState(() {});
                          _model.tasksAvailable = [];
                          safeSetState(() {});
                          _model.isPlanBoardEmpty = true;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.datePill2Model6,
                        updateCallback: () => safeSetState(() {}),
                        child: DatePill2Widget(
                          selected: false,
                          dayName: functions.planBoardWeekdayShort(functions
                              .planBoardAddDays(_model.selectedDate, 2)),
                          dayNumber: functions.planBoardDayNumber(functions
                              .planBoardAddDays(_model.selectedDate, 2)),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedDate =
                            functions.planBoardAddDays(_model.selectedDate, 3);
                        safeSetState(() {});
                        _model.isPlanBoardLoading = true;
                        safeSetState(() {});
                        _model.isPlanBoardEmpty = false;
                        safeSetState(() {});
                        _model.loadedPlanBoardSchedules = [];
                        safeSetState(() {});
                        _model.selectedSchedule = null;
                        safeSetState(() {});
                        _model.tasksAvailable = [];
                        safeSetState(() {});
                        _model.reloadedPlanBoardSchedulesQueryPill6 =
                            await querySchedulesRecordOnce(
                          limit: 1,
                        );
                        _model.loadedPlanBoardSchedules = _model
                            .reloadedPlanBoardSchedulesQueryPill6!
                            .toList()
                            .cast<SchedulesRecord>();
                        safeSetState(() {});
                        if (functions.planBoardHasSchedules(_model
                            .reloadedPlanBoardSchedulesQueryPill6
                            ?.toList())!) {
                          _model.selectedSchedule =
                              functions.planBoardFirstScheduleRef(_model
                                  .reloadedPlanBoardSchedulesQueryPill6
                                  ?.toList());
                          safeSetState(() {});
                          _model.reloadedPlanBoardItemsQueryPill6 =
                              await queryItemsRecordOnce(
                            limit: 50,
                          );
                          _model.tasksAvailable = _model
                              .reloadedPlanBoardItemsQueryPill6!
                              .toList()
                              .cast<ItemsRecord>();
                          safeSetState(() {});
                          _model.isPlanBoardEmpty =
                              !functions.planBoardHasItems(_model
                                  .reloadedPlanBoardItemsQueryPill6
                                  ?.toList())!;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        } else {
                          _model.selectedSchedule = null;
                          safeSetState(() {});
                          _model.tasksAvailable = [];
                          safeSetState(() {});
                          _model.isPlanBoardEmpty = true;
                          safeSetState(() {});
                          _model.isPlanBoardLoading = false;
                          safeSetState(() {});
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.datePill2Model7,
                        updateCallback: () => safeSetState(() {}),
                        child: DatePill2Widget(
                          selected: false,
                          dayName: functions.planBoardWeekdayShort(functions
                              .planBoardAddDays(_model.selectedDate, 3)),
                          dayNumber: functions.planBoardDayNumber(functions
                              .planBoardAddDays(_model.selectedDate, 3)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.ScheduleDragList(
                      width: double.infinity,
                      height: double.infinity,
                      itemsJson:
                          functions.itemsToJson(_model.tasksAvailable.toList()),
                      workStartIso: functions.buildWorkStart(
                          _model.selectedDate, _model.baseHour)!,
                      isLoading: _model.isPlanBoardLoading!,
                      onReorder: (itemsJson) async {
                        try {
                          final result = await FirebaseFunctions.instance
                              .httpsCallable('reorderScheduleItems')
                              .call({
                            "scheduleId": functions
                                .planBoardScheduleId(_model.selectedSchedule),
                            "orderedIds": functions
                                .scheduleReorderOrderedIds(itemsJson)
                                ?.toList(),
                          });
                          _model.cloudFunctionyk4 =
                              ReorderScheduleItemsCloudFunctionCallResponse(
                            succeeded: true,
                          );
                        } on FirebaseFunctionsException catch (error) {
                          _model.cloudFunctionyk4 =
                              ReorderScheduleItemsCloudFunctionCallResponse(
                            errorCode: error.code,
                            succeeded: false,
                          );
                        }

                        safeSetState(() {});
                      },
                      onItemTap: (itemId) async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: EditScheduleItemSheetWidget(
                                itemId: itemId,
                                title: _model.tasksAvailable
                                    .where((e) => itemId == e.reference.id)
                                    .toList()
                                    .firstOrNull
                                    ?.title,
                                start: _model.tasksAvailable
                                    .where((e) => itemId == e.reference.id)
                                    .toList()
                                    .firstOrNull
                                    ?.start,
                                duration: _model.tasksAvailable
                                    .where((e) => itemId == e.reference.id)
                                    .toList()
                                    .firstOrNull
                                    ?.durationMin,
                                locked: _model.tasksAvailable
                                    .where((e) => itemId == e.reference.id)
                                    .toList()
                                    .firstOrNull
                                    ?.locked,
                                itemsJson: functions.itemsToJson(
                                    _model.tasksAvailable.toList()),
                                scheduleId: functions.planBoardScheduleId(
                                    _model.selectedSchedule),
                                selectedDate: _model.selectedDate,
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).divider,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Изменения расписания уже сохранены. Для автоматического пересчета нужен flow, который учитывает сохраненные правки, а не пересобирает план из исходных задач.',
                                style: TextStyle(),
                              ),
                              duration: Duration(milliseconds: 4000),
                            ),
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          '3il3ri03' /* Перепланировать расписание */,
                        ),
                        icon: Icon(
                          Icons.auto_fix_high_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsets.all(24.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconColor: Colors.white,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'zffozfvg' /* Оптимизация потока с учетом 2 ... */,
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                font: GoogleFonts.spaceGrotesk(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                                lineHeight: 1.2,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/bottom_sheet/schedule_item/schedule_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_i_schedule_preview_model.dart';
export 'a_i_schedule_preview_model.dart';

/// Предварительный план построения расписания задач на день
class AISchedulePreviewWidget extends StatefulWidget {
  const AISchedulePreviewWidget({super.key});

  @override
  State<AISchedulePreviewWidget> createState() =>
      _AISchedulePreviewWidgetState();
}

class _AISchedulePreviewWidgetState extends State<AISchedulePreviewWidget> {
  late AISchedulePreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AISchedulePreviewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.resultSchedule = await queryScheduleProposalsRecordOnce(
        queryBuilder: (scheduleProposalsRecord) => scheduleProposalsRecord
            .where(
              'userId',
              isEqualTo: currentUserUid,
            )
            .where(
              'proposalId',
              isEqualTo: '',
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.dailyPlanTasks = (_model.responseScheduleProposal!.jsonBody!
              .toList()
              .map<TaskStructStruct?>(TaskStructStruct.maybeFromMap)
              .toList() as Iterable<TaskStructStruct?>)
          .withoutNulls
          .toList()
          .cast<TaskStructStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.8),
      child: Container(
        width: double.infinity,
        height: 620.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 36.0, 24.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '213oq7ao' /* Новый план */,
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.auto_awesome_rounded,
                              color: Color(0xFF22D3EE),
                              size: 32.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'r3q7sx9s' /* ОПТИМИЗИРОВАНО */,
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
                                    color: FlutterFlowTheme.of(context).accent1,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '4y0eqbww' /* Предлагаемый график на сегодня... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: StreamBuilder<List<ScheduleProposalsRecord>>(
                  stream: queryScheduleProposalsRecord(
                    queryBuilder: (scheduleProposalsRecord) =>
                        scheduleProposalsRecord
                            .where(
                              'userId',
                              isEqualTo: currentUserUid,
                            )
                            .where(
                              'proposalId',
                              isEqualTo: _model.resultSchedule?.reference.id,
                            ),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ScheduleProposalsRecord>
                        listViewScheduleProposalsRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final listViewScheduleProposalsRecord =
                        listViewScheduleProposalsRecordList.isNotEmpty
                            ? listViewScheduleProposalsRecordList.first
                            : null;

                    return Builder(
                      builder: (context) {
                        final tasks = listViewScheduleProposalsRecord?.schedule
                                .toList() ??
                            [];

                        return ListView.builder(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            20.0,
                            0,
                            20.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: tasks.length,
                          itemBuilder: (context, tasksIndex) {
                            final tasksItem = tasks[tasksIndex];
                            return wrapWithModel(
                              model: _model.scheduleItemModels.getModel(
                                tasksIndex.toString(),
                                tasksIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: ScheduleItemWidget(
                                key: Key(
                                  'Keyjt3_${tasksIndex.toString()}',
                                ),
                                start: dateTimeFormat(
                                  "H:mm",
                                  tasksItem.scheduledStart,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                end: dateTimeFormat(
                                  "H:mm",
                                  tasksItem.scheduledEnd,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                title: tasksItem.title,
                                duration: tasksItem.totalDurationMin.toDouble(),
                                energy_level: tasksItem.energyType,
                                has_energy: true,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: FFButtonWidget(
                        onPressed: () async {
                          await _model.resultSchedule!.reference.delete();
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'sq7m8ddu' /* Отменить */,
                        ),
                        options: FFButtonOptions(
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FFButtonWidget(
                        onPressed: () async {
                          try {
                            final result = await FirebaseFunctions.instance
                                .httpsCallable('applyScheduleProposal')
                                .call({
                              "proposalId": FFAppState().proposalId,
                            });
                            _model.responseScheduleProposal =
                                ApplyScheduleProposalCloudFunctionCallResponse(
                              data: result.data,
                              succeeded: true,
                              resultAsString: result.data.toString(),
                              jsonBody: result.data,
                            );
                          } on FirebaseFunctionsException catch (error) {
                            _model.responseScheduleProposal =
                                ApplyScheduleProposalCloudFunctionCallResponse(
                              errorCode: error.code,
                              succeeded: false,
                            );
                          }

                          FFAppState().scheduleId = getJsonField(
                            _model.responseScheduleProposal!.jsonBody,
                            r'''$.scheduleId''',
                          ).toString();
                          safeSetState(() {});
                          Navigator.pop(context);
                          await actions.clearStaleScheduledTasksForDate();

                          context.pushNamed(PlanBoardPageWidget.routeName);

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'snv700jh' /* Применить план */,
                        ),
                        icon: Icon(
                          Icons.check_circle_outlined,
                          size: 18.0,
                        ),
                        options: FFButtonOptions(
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: TextStyle(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

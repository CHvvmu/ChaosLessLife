import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_schedule_task_model.dart';
export 'my_schedule_task_model.dart';

/// Моя запланированная задача
class MyScheduleTaskWidget extends StatefulWidget {
  const MyScheduleTaskWidget({
    super.key,
    required this.scheduleTask,
    required this.itemId,
  });

  final ItemsRecord? scheduleTask;
  final String? itemId;

  @override
  State<MyScheduleTaskWidget> createState() => _MyScheduleTaskWidgetState();
}

class _MyScheduleTaskWidgetState extends State<MyScheduleTaskWidget> {
  late MyScheduleTaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyScheduleTaskModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Draggable<ItemsRecord>(
      data: widget.scheduleTask!,
      feedback: Material(
        type: MaterialType.transparency,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateTimeFormat(
                      "H:mm",
                      widget.scheduleTask!.start!,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.jetBrainsMono(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                          lineHeight: 1.3,
                        ),
                  ),
                  Text(
                    dateTimeFormat(
                      "H:mm",
                      widget.scheduleTask!.end!,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.jetBrainsMono(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(height: 2.0)),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE8FFF3),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2.0,
                        color: Color(0x1A000000),
                        offset: Offset(
                          0.0,
                          1.0,
                        ),
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).success,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.scheduleTask?.title,
                                  'нет',
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF373737),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.schedule_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 14.0,
                                  ),
                                  Text(
                                    '${widget.scheduleTask?.durationMin.toString()} мин',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.jetBrainsMono(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                FlutterFlowIconButton(
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.lock_open_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                if (widget.scheduleTask?.locked == true)
                                  FlutterFlowIconButton(
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.lock_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                              ],
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.delete_forever_outlined,
                                color: FlutterFlowTheme.of(context).error,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateTimeFormat(
                    "H:mm",
                    widget.scheduleTask!.start!,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.jetBrainsMono(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                        lineHeight: 1.3,
                      ),
                ),
                Text(
                  dateTimeFormat(
                    "H:mm",
                    widget.scheduleTask!.end!,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.jetBrainsMono(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                ),
              ].divide(SizedBox(height: 2.0)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE8FFF3),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2.0,
                      color: Color(0x1A000000),
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                      spreadRadius: 0.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).success,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.scheduleTask?.title,
                                'нет',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF373737),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.schedule_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                                Text(
                                  '${widget.scheduleTask?.durationMin.toString()} мин',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.jetBrainsMono(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              FlutterFlowIconButton(
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.lock_open_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              if (widget.scheduleTask?.locked == true)
                                FlutterFlowIconButton(
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.lock_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                            ],
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.delete_forever_outlined,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}

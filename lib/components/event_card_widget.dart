import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event_card_model.dart';
export 'event_card_model.dart';

/// Displays a single behavior timeline event row.
class EventCardWidget extends StatefulWidget {
  const EventCardWidget({
    super.key,
    this.eventType,
    this.eventLabel,
    this.payloadTitle,
    this.payloadStatus,
    this.relativeTime,
    this.dateLabel,
    this.taskId,
  });

  final String? eventType;
  final String? eventLabel;
  final String? payloadTitle;
  final String? payloadStatus;
  final DateTime? relativeTime;
  final String? dateLabel;
  final String? taskId;

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  late EventCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.eventType!,
              style: TextStyle(),
            ),
            Text(
              widget.payloadStatus!,
              style: TextStyle(),
            ),
            Text(
              widget.dateLabel!,
              style: TextStyle(),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.history_rounded,
                    color: FlutterFlowTheme.of(context).info,
                    size: 18.0,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.eventLabel!,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
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
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.payloadTitle!,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.dmSans(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                    ].divide(SizedBox(height: 2.0)),
                  ),
                ),
                Text(
                  dateTimeFormat(
                    "d MMMM  H:mm",
                    widget.relativeTime,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.nunito(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ],
        ),
      ),
    );
  }
}

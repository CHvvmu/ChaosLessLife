import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'metric_card2_model.dart';
export 'metric_card2_model.dart';

class MetricCard2Widget extends StatefulWidget {
  const MetricCard2Widget({
    super.key,
    this.label,
    this.value,
    this.trend,
    this.color,
  });

  final String? label;
  final double? value;
  final double? trend;
  final Color? color;

  @override
  State<MetricCard2Widget> createState() => _MetricCard2WidgetState();
}

class _MetricCard2WidgetState extends State<MetricCard2Widget> {
  late MetricCard2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MetricCard2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        width: 146.5,
        height: 56.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget.label,
                'Завершено задач',
              ),
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.dmSans(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.value?.toString(),
                    '42',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.trend?.toString(),
                    '+12%',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.dmSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: widget.color,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}

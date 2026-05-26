import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'metric_card_model.dart';
export 'metric_card_model.dart';

class MetricCardWidget extends StatefulWidget {
  const MetricCardWidget({
    super.key,
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  @override
  State<MetricCardWidget> createState() => _MetricCardWidgetState();
}

class _MetricCardWidgetState extends State<MetricCardWidget> {
  late MetricCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MetricCardModel());

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
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).divider,
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
              valueOrDefault<String>(
                widget.label,
                'Темп речи',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 10.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    lineHeight: 1.2,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget.value,
                '145 сл/мин',
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    lineHeight: 1.4,
                  ),
            ),
          ].divide(SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}

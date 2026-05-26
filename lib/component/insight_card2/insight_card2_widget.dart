import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'insight_card2_model.dart';
export 'insight_card2_model.dart';

class InsightCard2Widget extends StatefulWidget {
  const InsightCard2Widget({
    super.key,
    this.bg,
    this.icon,
    this.iconColor,
    this.title,
    this.desc,
  });

  final Color? bg;
  final String? icon;
  final Color? iconColor;
  final String? title;
  final String? desc;

  @override
  State<InsightCard2Widget> createState() => _InsightCard2WidgetState();
}

class _InsightCard2WidgetState extends State<InsightCard2Widget> {
  late InsightCard2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsightCard2Model());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).divider,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: widget.bg,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.psychology_rounded,
                  color: widget.iconColor,
                  size: 22.0,
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
                      valueOrDefault<String>(
                        widget.title,
                        'Эффект настроения',
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.desc,
                        'Ваша продуктивность вырастает на 32%, если утро начинается с позитивного чек-ина.',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}

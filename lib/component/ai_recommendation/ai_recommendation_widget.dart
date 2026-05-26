import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ai_recommendation_model.dart';
export 'ai_recommendation_model.dart';

class AiRecommendationWidget extends StatefulWidget {
  const AiRecommendationWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  State<AiRecommendationWidget> createState() => _AiRecommendationWidgetState();
}

class _AiRecommendationWidgetState extends State<AiRecommendationWidget> {
  late AiRecommendationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiRecommendationModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x1522D3EE),
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Color(0x4422D3EE),
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
              Icon(
                Icons.auto_awesome_rounded,
                color: Color(0xFF22D3EE),
                size: 20.0,
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
                        'bakx6bs1' /* AI РЕКОМЕНДАЦИЯ */,
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.w800,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            color: Color(0xFF22D3EE),
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                            lineHeight: 1.2,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.text,
                        'На основе ваших звонков вчера, встреча в 14:00 может затянуться. Рекомендую перенести задачу \'Отчет\' на 16:30 для сохранения фокуса.',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
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

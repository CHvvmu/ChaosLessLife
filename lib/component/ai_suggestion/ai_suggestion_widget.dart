import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ai_suggestion_model.dart';
export 'ai_suggestion_model.dart';

class AiSuggestionWidget extends StatefulWidget {
  const AiSuggestionWidget({
    super.key,
    this.icon,
    this.label,
  });

  final String? icon;
  final String? label;

  @override
  State<AiSuggestionWidget> createState() => _AiSuggestionWidgetState();
}

class _AiSuggestionWidgetState extends State<AiSuggestionWidget> {
  late AiSuggestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiSuggestionModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x15F472B6),
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: Color(0xFFF472B6),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.add_task_rounded,
                color: Color(0xFFF472B6),
                size: 16.0,
              ),
              Text(
                valueOrDefault<String>(
                  widget.label,
                  'Создать задачу: Смета',
                ),
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      font: GoogleFonts.jetBrainsMono(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      ),
                      color: Color(0xFFF472B6),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                      lineHeight: 1.3,
                    ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}

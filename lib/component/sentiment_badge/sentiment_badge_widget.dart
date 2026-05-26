import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sentiment_badge_model.dart';
export 'sentiment_badge_model.dart';

class SentimentBadgeWidget extends StatefulWidget {
  const SentimentBadgeWidget({
    super.key,
    this.bg,
    this.border,
    this.icon,
    this.color,
    this.label,
  });

  final Color? bg;
  final Color? border;
  final String? icon;
  final Color? color;
  final String? label;

  @override
  State<SentimentBadgeWidget> createState() => _SentimentBadgeWidgetState();
}

class _SentimentBadgeWidgetState extends State<SentimentBadgeWidget> {
  late SentimentBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SentimentBadgeModel());

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
        color: valueOrDefault<Color>(
          widget.bg,
          Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: widget.border!,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.mood_rounded,
              color: valueOrDefault<Color>(
                widget.color,
                Color(0x00000000),
              ),
              size: 14.0,
            ),
            Text(
              valueOrDefault<String>(
                widget.label,
                'Позитивный',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      widget.color,
                      Color(0x00000000),
                    ),
                    fontSize: 10.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    lineHeight: 1.2,
                  ),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ),
    );
  }
}

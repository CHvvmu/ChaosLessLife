import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'activity_card_model.dart';
export 'activity_card_model.dart';

class ActivityCardWidget extends StatefulWidget {
  const ActivityCardWidget({
    super.key,
    this.color,
    this.title,
    this.subtitle,
    this.time,
  });

  final Color? color;
  final String? title;
  final String? subtitle;
  final String? time;

  @override
  State<ActivityCardWidget> createState() => _ActivityCardWidgetState();
}

class _ActivityCardWidgetState extends State<ActivityCardWidget> {
  late ActivityCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityCardModel());

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
          color: Color(0xFF333333),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 4.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.color,
                  Color(0x00000000),
                ),
                borderRadius: BorderRadius.circular(2.0),
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
                      'Звонок: Переговоры по API',
                    ),
                    maxLines: 1,
                    style: GoogleFonts.jetBrainsMono(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.subtitle,
                      'Транскрибация завершена • 12 мин',
                    ),
                    style: GoogleFonts.jetBrainsMono(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                    ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.time,
                '14:20',
              ),
              style: GoogleFonts.jetBrainsMono(
                color: FlutterFlowTheme.of(context).hint,
                fontSize: 12.0,
              ),
            ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}

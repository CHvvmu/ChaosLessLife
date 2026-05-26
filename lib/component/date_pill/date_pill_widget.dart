import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'date_pill_model.dart';
export 'date_pill_model.dart';

class DatePillWidget extends StatefulWidget {
  const DatePillWidget({
    super.key,
    this.active,
    this.dayName,
    this.dayNum,
  });

  final bool? active;
  final String? dayName;
  final String? dayNum;

  @override
  State<DatePillWidget> createState() => _DatePillWidgetState();
}

class _DatePillWidgetState extends State<DatePillWidget> {
  late DatePillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePillModel());

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
      width: 56.0,
      height: 72.0,
      decoration: BoxDecoration(
        color: widget.active!
            ? FlutterFlowTheme.of(context).primary
            : FlutterFlowTheme.of(context).tertiary,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: widget.active!
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.dayName!,
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  font: GoogleFonts.jetBrainsMono(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                  ),
                  color: Color(0xFFC0C0C0),
                  fontSize: 10.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                  lineHeight: 1.2,
                ),
          ),
          Text(
            widget.dayNum!,
            style: TextStyle(),
          ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}

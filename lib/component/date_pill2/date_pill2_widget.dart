import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'date_pill2_model.dart';
export 'date_pill2_model.dart';

class DatePill2Widget extends StatefulWidget {
  const DatePill2Widget({
    super.key,
    this.selected,
    this.dayName,
    this.dayNumber,
  });

  final bool? selected;
  final String? dayName;
  final String? dayNumber;

  @override
  State<DatePill2Widget> createState() => _DatePill2WidgetState();
}

class _DatePill2WidgetState extends State<DatePill2Widget> {
  late DatePill2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePill2Model());

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
        width: 44.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.selected!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).secondaryBackground,
            FlutterFlowTheme.of(context).secondaryBackground,
          ),
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: widget.selected!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).divider,
            width: 1.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.dayName!,
                style: TextStyle(),
              ),
              Text(
                widget.dayNumber!,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      color: widget.selected!
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      lineHeight: 1.35,
                    ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}

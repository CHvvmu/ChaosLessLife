import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'time_picker_field_model.dart';
export 'time_picker_field_model.dart';

class TimePickerFieldWidget extends StatefulWidget {
  const TimePickerFieldWidget({
    super.key,
    this.label,
    this.time,
  });

  final String? label;
  final String? time;

  @override
  State<TimePickerFieldWidget> createState() => _TimePickerFieldWidgetState();
}

class _TimePickerFieldWidgetState extends State<TimePickerFieldWidget> {
  late TimePickerFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePickerFieldModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          valueOrDefault<String>(
            widget.label,
            'Начало',
          ),
          style: FlutterFlowTheme.of(context).labelLarge.override(
                font: GoogleFonts.nunito(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                ),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                lineHeight: 1.2,
              ),
        ),
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(
                FlutterFlowTheme.of(context).designToken.radius.md),
            border: Border.all(
              color: FlutterFlowTheme.of(context).divider,
              width: 1.0,
            ),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.all(
                FlutterFlowTheme.of(context).designToken.spacing.md),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20.0,
                ),
                Text(
                  valueOrDefault<String>(
                    widget.time,
                    '09:30',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        lineHeight: 1.45,
                      ),
                ),
              ].divide(SizedBox(
                  width: FlutterFlowTheme.of(context).designToken.spacing.sm)),
            ),
          ),
        ),
      ].divide(SizedBox(
          height: FlutterFlowTheme.of(context).designToken.spacing.xs)),
    );
  }
}

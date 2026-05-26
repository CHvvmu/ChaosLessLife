import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'form_label_model.dart';
export 'form_label_model.dart';

class FormLabelWidget extends StatefulWidget {
  const FormLabelWidget({
    super.key,
    this.label,
    this.required,
  });

  final String? label;
  final bool? required;

  @override
  State<FormLabelWidget> createState() => _FormLabelWidgetState();
}

class _FormLabelWidgetState extends State<FormLabelWidget> {
  late FormLabelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormLabelModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          valueOrDefault<String>(
            widget.label,
            'Название задачи',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              ),
        ),
        if (widget.required ?? true)
          Text(
            FFLocalizations.of(context).getText(
              'vk0g14i2' /* * */,
            ),
            style: GoogleFonts.jetBrainsMono(
              color: FlutterFlowTheme.of(context).error,
            ),
          ),
      ].divide(SizedBox(width: 4.0)),
    );
  }
}

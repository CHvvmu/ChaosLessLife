import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'num_key_model.dart';
export 'num_key_model.dart';

class NumKeyWidget extends StatefulWidget {
  const NumKeyWidget({
    super.key,
    this.digit,
  });

  final int? digit;

  @override
  State<NumKeyWidget> createState() => _NumKeyWidgetState();
}

class _NumKeyWidgetState extends State<NumKeyWidget> {
  late NumKeyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NumKeyModel());

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
      width: 72.0,
      height: 72.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.0),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        valueOrDefault<String>(
          widget.digit?.toString(),
          '1',
        ),
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.inter(
                fontWeight: FontWeight.normal,
                fontStyle:
                    FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 26.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.normal,
              fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              lineHeight: 1.25,
            ),
      ),
    );
  }
}

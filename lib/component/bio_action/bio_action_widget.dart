import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bio_action_model.dart';
export 'bio_action_model.dart';

class BioActionWidget extends StatefulWidget {
  const BioActionWidget({
    super.key,
    this.icon,
  });

  final String? icon;

  @override
  State<BioActionWidget> createState() => _BioActionWidgetState();
}

class _BioActionWidgetState extends State<BioActionWidget> {
  late BioActionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BioActionModel());

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
      width: 64.0,
      height: 64.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            color: Color(0x1A000000),
            offset: Offset(
              0.0,
              1.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Icon(
        Icons.face_retouching_natural_rounded,
        color: FlutterFlowTheme.of(context).primary,
        size: 32.0,
      ),
    );
  }
}

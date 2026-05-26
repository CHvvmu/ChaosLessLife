import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'step_indicator_model.dart';
export 'step_indicator_model.dart';

class StepIndicatorWidget extends StatefulWidget {
  const StepIndicatorWidget({
    super.key,
    this.active,
  });

  final bool? active;

  @override
  State<StepIndicatorWidget> createState() => _StepIndicatorWidgetState();
}

class _StepIndicatorWidgetState extends State<StepIndicatorWidget> {
  late StepIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepIndicatorModel());

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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: widget.active!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).divider,
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ].divide(SizedBox(width: 4.0)),
    );
  }
}

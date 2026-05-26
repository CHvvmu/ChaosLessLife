import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'wave_bar_model.dart';
export 'wave_bar_model.dart';

class WaveBarWidget extends StatefulWidget {
  const WaveBarWidget({
    super.key,
    this.height,
    this.color,
  });

  final double? height;
  final Color? color;

  @override
  State<WaveBarWidget> createState() => _WaveBarWidgetState();
}

class _WaveBarWidgetState extends State<WaveBarWidget> {
  late WaveBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaveBarModel());

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
      width: 4.0,
      height: widget.height,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.color,
          Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(2.0),
      ),
    );
  }
}

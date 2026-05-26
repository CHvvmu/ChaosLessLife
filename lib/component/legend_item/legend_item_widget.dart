import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'legend_item_model.dart';
export 'legend_item_model.dart';

class LegendItemWidget extends StatefulWidget {
  const LegendItemWidget({
    super.key,
    this.dotColor,
    this.label,
  });

  final Color? dotColor;
  final String? label;

  @override
  State<LegendItemWidget> createState() => _LegendItemWidgetState();
}

class _LegendItemWidgetState extends State<LegendItemWidget> {
  late LegendItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LegendItemModel());

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
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: widget.dotColor,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.label,
            '45% Энергичность',
          ),
          style: FlutterFlowTheme.of(context).bodySmall.override(
                font: GoogleFonts.jetBrainsMono(
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                lineHeight: 1.4,
              ),
        ),
      ].divide(SizedBox(width: 8.0)),
    );
  }
}

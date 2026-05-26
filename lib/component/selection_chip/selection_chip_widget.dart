import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'selection_chip_model.dart';
export 'selection_chip_model.dart';

class SelectionChipWidget extends StatefulWidget {
  const SelectionChipWidget({
    super.key,
    this.selected,
    this.icon,
    this.label,
  });

  final bool? selected;
  final String? icon;
  final String? label;

  @override
  State<SelectionChipWidget> createState() => _SelectionChipWidgetState();
}

class _SelectionChipWidgetState extends State<SelectionChipWidget> {
  late SelectionChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectionChipModel());

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
        color: widget.selected!
            ? FlutterFlowTheme.of(context).primary
            : FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: widget.selected!
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 16.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.flag_outlined,
              color: widget.selected!
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryText,
              size: 14.0,
            ),
            Text(
              valueOrDefault<String>(
                widget.label,
                'Низкий',
              ),
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    ),
                    color: widget.selected!
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    lineHeight: 1.3,
                  ),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ),
    );
  }
}

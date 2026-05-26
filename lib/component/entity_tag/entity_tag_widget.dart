import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'entity_tag_model.dart';
export 'entity_tag_model.dart';

class EntityTagWidget extends StatefulWidget {
  const EntityTagWidget({
    super.key,
    this.icon,
    this.text,
  });

  final String? icon;
  final String? text;

  @override
  State<EntityTagWidget> createState() => _EntityTagWidgetState();
}

class _EntityTagWidgetState extends State<EntityTagWidget> {
  late EntityTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntityTagModel());

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
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.business_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 12.0,
            ),
            Text(
              valueOrDefault<String>(
                widget.text,
                'ООО Вектор',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 10.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    lineHeight: 1.2,
                  ),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'group_header_model.dart';
export 'group_header_model.dart';

class GroupHeaderWidget extends StatefulWidget {
  const GroupHeaderWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<GroupHeaderWidget> createState() => _GroupHeaderWidgetState();
}

class _GroupHeaderWidgetState extends State<GroupHeaderWidget> {
  late GroupHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupHeaderModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 8.0),
        child: Text(
          valueOrDefault<String>(
            widget.title,
            'ИНТЕРФЕЙС И ИИ',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.jetBrainsMono(
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                lineHeight: 1.3,
              ),
        ),
      ),
    );
  }
}

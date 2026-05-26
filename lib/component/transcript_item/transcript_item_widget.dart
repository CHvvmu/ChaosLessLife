import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'transcript_item_model.dart';
export 'transcript_item_model.dart';

class TranscriptItemWidget extends StatefulWidget {
  const TranscriptItemWidget({
    super.key,
    this.isUser,
    this.sender,
    this.time,
    this.text,
  });

  final bool? isUser;
  final String? sender;
  final String? time;
  final String? text;

  @override
  State<TranscriptItemWidget> createState() => _TranscriptItemWidgetState();
}

class _TranscriptItemWidgetState extends State<TranscriptItemWidget> {
  late TranscriptItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TranscriptItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.sender!,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.jetBrainsMono(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        lineHeight: 1.2,
                      ),
                ),
                Text(
                  widget.time!,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.jetBrainsMono(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).hint,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        lineHeight: 1.2,
                      ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 280.0,
              ),
              decoration: BoxDecoration(
                color: widget.isUser!
                    ? Color(0x2222D3EE)
                    : FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  color: widget.isUser!
                      ? Color(0xFF22D3EE)
                      : FlutterFlowTheme.of(context).divider,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  widget.text!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        lineHeight: 1.4,
                      ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}

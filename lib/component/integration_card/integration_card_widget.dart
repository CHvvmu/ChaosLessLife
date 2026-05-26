import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'integration_card_model.dart';
export 'integration_card_model.dart';

class IntegrationCardWidget extends StatefulWidget {
  const IntegrationCardWidget({
    super.key,
    this.connected,
    this.icon_slug,
    this.title,
  });

  final bool? connected;
  final String? icon_slug;
  final String? title;

  @override
  State<IntegrationCardWidget> createState() => _IntegrationCardWidgetState();
}

class _IntegrationCardWidgetState extends State<IntegrationCardWidget> {
  late IntegrationCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntegrationCardModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: widget.connected!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).divider,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.telegram,
                  color: widget.connected!
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title!,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 6.0,
                          height: 6.0,
                          decoration: BoxDecoration(
                            color: widget.connected!
                                ? FlutterFlowTheme.of(context).success
                                : FlutterFlowTheme.of(context).hint,
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        Text(
                          widget.connected! ? 'Подключено' : 'Не подключено',
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                font: GoogleFonts.jetBrainsMono(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                                lineHeight: 1.2,
                              ),
                        ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ].divide(SizedBox(height: 2.0)),
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: widget.connected! ? 'Настроить' : 'Подключить',
                options: FFButtonOptions(
                  height: 36.0,
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}

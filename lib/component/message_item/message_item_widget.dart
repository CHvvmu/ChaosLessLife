import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'message_item_model.dart';
export 'message_item_model.dart';

class MessageItemWidget extends StatefulWidget {
  const MessageItemWidget({
    super.key,
    this.platform,
    this.sender,
    this.time,
    this.priority,
    this.message,
    this.draft,
  });

  final String? platform;
  final String? sender;
  final String? time;
  final String? priority;
  final String? message;
  final String? draft;

  @override
  State<MessageItemWidget> createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget> {
  late MessageItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageItemModel());

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
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Color(0xFF333333),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent3,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: Color(0xFF333333),
                            width: 1.0,
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.telegram,
                          color: Color(0xFF22D3EE),
                          size: 14.0,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.sender,
                              'Игорь Волков',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.jetBrainsMono(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                  lineHeight: 1.3,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.time,
                              '2 мин назад',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.jetBrainsMono(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).hint,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x20F472B6),
                      borderRadius: BorderRadius.circular(2.0),
                      border: Border.all(
                        color: Color(0xFFF472B6),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.priority,
                          'СРОЧНО',
                        ),
                        style: GoogleFonts.inter(
                          color: Color(0xFFF472B6),
                          fontWeight: FontWeight.w600,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).success,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.message,
                      'Привет! Нам нужно утвердить смету по проекту \'Сириус\' до 14:00. Сможешь посмотреть?',
                    ),
                    style: GoogleFonts.jetBrainsMono(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14.0,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: Color(0xFF4ADE80),
                        size: 16.0,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'mym4lrjd' /* AI ЧЕРНОВИК */,
                        ),
                        style: GoogleFonts.jetBrainsMono(
                          color: Color(0xFF4ADE80),
                          fontWeight: FontWeight.w600,
                          fontSize: 11.0,
                        ),
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x084ADE80),
                      borderRadius: BorderRadius.circular(2.0),
                      border: Border.all(
                        color: Color(0x334ADE80),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.draft,
                          'Привет, Игорь! Да, я сейчас ознакомлюсь со сметой и пришлю подтверждение в течение 15 минут.',
                        ),
                        style: GoogleFonts.inter(
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        'p116dg1w' /* Отправить */,
                      ),
                      icon: Icon(
                        Icons.send_rounded,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 44.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconColor: Colors.white,
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: FFLocalizations.of(context).getText(
                      'ls6qu96r' /* Правка */,
                    ),
                    options: FFButtonOptions(
                      height: 36.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  FlutterFlowIconButton(
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.refresh_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}

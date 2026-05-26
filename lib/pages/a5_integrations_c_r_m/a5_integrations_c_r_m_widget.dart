import '/component/integration_card/integration_card_widget.dart';
import '/component/section_header/section_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'a5_integrations_c_r_m_model.dart';
export 'a5_integrations_c_r_m_model.dart';

class A5IntegrationsCRMWidget extends StatefulWidget {
  const A5IntegrationsCRMWidget({super.key});

  static String routeName = 'A5_IntegrationsCRM';
  static String routePath = '/a5IntegrationsCRM';

  @override
  State<A5IntegrationsCRMWidget> createState() =>
      _A5IntegrationsCRMWidgetState();
}

class _A5IntegrationsCRMWidgetState extends State<A5IntegrationsCRMWidget> {
  late A5IntegrationsCRMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => A5IntegrationsCRMModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).divider,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '84221yrb' /* Интеграции */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                    lineHeight: 1.25,
                                  ),
                            ),
                          ],
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'oa75wf7i' /* Синхронизация с вашим рабочим ... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: GoogleFonts.jetBrainsMono(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                                lineHeight: 1.4,
                              ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 4.0,
                      buttonSize: 40.0,
                      fillColor: Color(0x2222D3EE),
                      icon: Icon(
                        Icons.settings_input_component_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.sectionHeaderModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: SectionHeaderWidget(
                            title: 'Мессенджеры и связь',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.integrationCardModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: IntegrationCardWidget(
                            connected: true,
                            icon_slug: 'telegram',
                            title: 'Telegram',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.integrationCardModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: IntegrationCardWidget(
                            connected: false,
                            icon_slug: 'slack',
                            title: 'Slack',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.integrationCardModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: IntegrationCardWidget(
                            connected: false,
                            icon_slug: 'whatsapp',
                            title: 'WhatsApp Business',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.sectionHeaderModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: SectionHeaderWidget(
                            title: 'CRM Системы',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.integrationCardModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: IntegrationCardWidget(
                            connected: true,
                            icon_slug: 'bitrix24',
                            title: 'Bitrix24',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.integrationCardModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: IntegrationCardWidget(
                            connected: false,
                            icon_slug: 'airplay',
                            title: 'amoCRM',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.sectionHeaderModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: SectionHeaderWidget(
                            title: 'Планирование',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.integrationCardModel6,
                          updateCallback: () => safeSetState(() {}),
                          child: IntegrationCardWidget(
                            connected: true,
                            icon_slug: 'googlecalendar',
                            title: 'Google Calendar',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.integrationCardModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: IntegrationCardWidget(
                            connected: false,
                            icon_slug: 'trello',
                            title: 'Trello',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x1022D3EE),
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Color(0x4422D3EE),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: Color(0xFF22D3EE),
                              size: 20.0,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'c786b22m' /* Безопасность данных */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          font: GoogleFonts.jetBrainsMono(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF22D3EE),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                          lineHeight: 1.3,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'nq5j1cli' /* Все интеграции используют прот... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.jetBrainsMono(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).divider,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: FFLocalizations.of(context).getText(
                    '2q3pun1a' /* Проверить все соединения */,
                  ),
                  icon: Icon(
                    Icons.sync_rounded,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 44.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconColor: FlutterFlowTheme.of(context).primaryBackground,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: GoogleFonts.inter(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

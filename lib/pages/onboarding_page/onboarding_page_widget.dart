import '/component/feature_card/feature_card_widget.dart';
import '/component/step_indicator/step_indicator_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_page_model.dart';
export 'onboarding_page_model.dart';

/// Introduces the app and sends new users into authentication.
class OnboardingPageWidget extends StatefulWidget {
  const OnboardingPageWidget({super.key});

  static String routeName = 'OnboardingPage';
  static String routePath = '/onboarding';

  @override
  State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget> {
  late OnboardingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingPageModel());

    _model.switchValue = true;
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
      body: Container(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 24.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.goNamed(AuthPageWidget.routeName);
                    },
                    text: FFLocalizations.of(context).getText(
                      'btoo5o3v' /* Пропустить */,
                    ),
                    options: FFButtonOptions(
                      height: 44.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '3a7s6td0' /* Жизнь без хаоса */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.nunito(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                            lineHeight: 1.2,
                          ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF22D3EE),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'yf5xsrqn' /* AI-АССИСТЕНТ v1.0 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.jetBrainsMono(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.black,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '9d3vqvym' /* Ваш персональный нейро-помощни... */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                  ],
                ),
                wrapWithModel(
                  model: _model.featureCardModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: FeatureCardWidget(
                    icon: 'mic_none_rounded',
                    title: 'Голосовое управление',
                    desc:
                        'Распознавание команд на естественном языке. Просто скажите, что нужно сделать.',
                  ),
                ),
                wrapWithModel(
                  model: _model.featureCardModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: FeatureCardWidget(
                    icon: 'call_rounded',
                    title: 'Умные звонки',
                    desc:
                        'Транскрибация встреч в реальном времени и автоматические отчеты по итогам.',
                  ),
                ),
                wrapWithModel(
                  model: _model.featureCardModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: FeatureCardWidget(
                    icon: 'auto_awesome_rounded',
                    title: 'Нейро-планирование',
                    desc:
                        'ИИ анализирует ваш календарь и рекомендует идеальное время для глубокой работы.',
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.graphic_eq_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'updkssds' /* Голосовая активация */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'qp8n2xf2' /* Активируйте ассистента фразой ... */,
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '65r3o51l' /* Включить отклик голосом */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                            Switch(
                              value: _model.switchValue!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue = newValue);
                              },
                              activeThumbColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.goNamed(AuthPageWidget.routeName);
                      },
                      text: FFLocalizations.of(context).getText(
                        'qcqd0vkd' /* Настроить и продолжить */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.stepIndicatorModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: StepIndicatorWidget(
                            active: true,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.stepIndicatorModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: StepIndicatorWidget(
                            active: false,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.stepIndicatorModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: StepIndicatorWidget(
                            active: false,
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '3wg91a8v' /* SYSTEM_READY: УСТАНОВЛЕНО_ШИФР... */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.jetBrainsMono(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).success,
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                              lineHeight: 1.2,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '8wrfmr39' /* v1.0.4-stable // 152-FZ Compli... */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
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
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ),
        ),
      ),
    );
  }
}

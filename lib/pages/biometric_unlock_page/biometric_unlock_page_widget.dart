import '/component/bio_action/bio_action_widget.dart';
import '/component/num_key/num_key_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'biometric_unlock_page_model.dart';
export 'biometric_unlock_page_model.dart';

/// Optional biometric or PIN setup step after authentication.
class BiometricUnlockPageWidget extends StatefulWidget {
  const BiometricUnlockPageWidget({super.key});

  static String routeName = 'BiometricUnlockPage';
  static String routePath = '/biometric-unlock';

  @override
  State<BiometricUnlockPageWidget> createState() =>
      _BiometricUnlockPageWidgetState();
}

class _BiometricUnlockPageWidgetState extends State<BiometricUnlockPageWidget> {
  late BiometricUnlockPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BiometricUnlockPageModel());

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
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      Icons.open_with,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 40.0,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'raltfris' /* Жизнь без хаоса */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                              lineHeight: 1.3,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'odif3755' /* AI-АССИСТЕНТ */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.jetBrainsMono(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                              lineHeight: 1.2,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
              Container(
                height: 24.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'nvc25ing' /* Добро пожаловать */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'o7h6ipd2' /* Введите PIN-код для доступа к ... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          lineHeight: 1.5,
                        ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).divider,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).divider,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ].divide(SizedBox(width: 24.0)),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.numKeyModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 1,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.numKeyModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 2,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.numKeyModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.numKeyModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 4,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.numKeyModel5,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 5,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.numKeyModel6,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 6,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.numKeyModel7,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 7,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.numKeyModel8,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 8,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.numKeyModel9,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 9,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 72.0,
                        height: 72.0,
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.backspace_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.numKeyModel10,
                        updateCallback: () => safeSetState(() {}),
                        child: NumKeyWidget(
                          digit: 0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed(HomePageWidget.routeName);
                        },
                        child: Container(
                          width: 72.0,
                          height: 72.0,
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xflde7u0' /* OK */,
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'z3rl005q' /* Или воспользуйтесь биометрией */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          font: GoogleFonts.jetBrainsMono(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).hint,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                          lineHeight: 1.3,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.bioActionModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: BioActionWidget(
                            icon: 'face_retouching_natural_rounded',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.bioActionModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: BioActionWidget(
                            icon: 'fingerprint_rounded',
                          ),
                        ),
                      ].divide(SizedBox(width: 24.0)),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.goNamed(HomePageWidget.routeName);
                        },
                        text: FFLocalizations.of(context).getText(
                          'vzz1gt8u' /* Забыли PIN? */,
                        ),
                        options: FFButtonOptions(
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.goNamed(HomePageWidget.routeName);
                        },
                        text: FFLocalizations.of(context).getText(
                          'l3uipv7s' /* Выйти */,
                        ),
                        options: FFButtonOptions(
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).divider,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_rounded,
                          color: FlutterFlowTheme.of(context).success,
                          size: 14.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'zcj3ka3h' /* Ваши данные защищены по станда... */,
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                                lineHeight: 1.2,
                              ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

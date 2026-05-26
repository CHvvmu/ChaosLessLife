import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'voice_capture_page_model.dart';
export 'voice_capture_page_model.dart';

/// Core voice capture pipeline for recording, upload, transcription, syntax
/// analysis, review readiness, and error recovery.
class VoiceCapturePageWidget extends StatefulWidget {
  const VoiceCapturePageWidget({super.key});

  static String routeName = 'VoiceCapturePage';
  static String routePath = '/voice-capture';

  @override
  State<VoiceCapturePageWidget> createState() => _VoiceCapturePageWidgetState();
}

class _VoiceCapturePageWidgetState extends State<VoiceCapturePageWidget> {
  late VoiceCapturePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceCapturePageModel());

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
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(HomePageWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            'c9n2ss27' /* На главную */,
                          ),
                          options: FFButtonOptions(
                            height: 42.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFA8B5A0),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'kkjgf438' /* Голосовой захват */,
                          ),
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '4m9mjdvm' /* Основная страница для записи, ... */,
                      ),
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.dmSans(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ].divide(SizedBox(height: 6.0)),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.mic,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
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
                                    FFLocalizations.of(context).getText(
                                      'p09se4gq' /* 1. Запись */,
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.dmSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'gv8u3kiw' /* Запишите голосовую заметку, за... */,
                                    ),
                                    maxLines: 3,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.dmSans(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            if (_model.captureStage == 'recording')
                              Text(
                                FFLocalizations.of(context).getText(
                                  'vc5xcg5t' /* Текущий */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.nunito(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                              ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 10.0,
                                  height: 18.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(999.0),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(999.0),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 22.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(999.0),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 34.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(999.0),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(999.0),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  height: 16.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(999.0),
                                  ),
                                ),
                              ].divide(SizedBox(width: 6.0)),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (!_model.isRecording)
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.startRecResult =
                                        await actions.manageRecording(
                                      true,
                                    );
                                    _model.isRecording = true;
                                    _model.captureStage = 'recording';
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '6ymrdpnc' /* Начать запись */,
                                  ),
                                  icon: Icon(
                                    Icons.mic,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor:
                                        FlutterFlowTheme.of(context).info,
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: TextStyle(
                                      color: FlutterFlowTheme.of(context).info,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                            if (_model.isRecording)
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.stopRecAudioUrl =
                                        await actions.manageRecording(
                                      false,
                                    );
                                    _model.isRecording = false;
                                    _model.uploadedAudioUrl =
                                        _model.stopRecAudioUrl!;
                                    _model.captureStage = 'uploading';
                                    safeSetState(() {});
                                    _model.newSessionId =
                                        await actions.createCaptureSession(
                                      _model.stopRecAudioUrl,
                                    );
                                    _model.captureSessionId =
                                        _model.newSessionId;
                                    _model.captureStage = 'transcribing';
                                    safeSetState(() {});
                                    await actions.watchCaptureSession(
                                      _model.newSessionId,
                                    );
                                    _model.captureStage = 'ready';
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'mx9rxqyk' /* Остановить запись */,
                                  ),
                                  icon: Icon(
                                    Icons.stop,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor:
                                        FlutterFlowTheme.of(context).info,
                                    color: FlutterFlowTheme.of(context).error,
                                    textStyle: TextStyle(
                                      color: FlutterFlowTheme.of(context).info,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
                if (_model.captureStage == 'uploading')
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.cloud_upload,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 20.0,
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
                                      FFLocalizations.of(context).getText(
                                        'a05jlj2f' /* 2. Загрузка */,
                                      ),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ex12mh4j' /* Аудиофайл подготавливается и п... */,
                                      ),
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              if (_model.captureStage == 'uploading')
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'z63fl5lb' /* Текущий */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.nunito(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          if (_model.captureStage == 'uploading')
                            CircularPercentIndicator(
                              percent: 0.0,
                              radius: 14.0,
                              lineWidth: 3.0,
                              animation: false,
                              animateFromLastPercent: true,
                            ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                if (_model.captureStage == 'transcribing')
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.subtitles,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
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
                                      FFLocalizations.of(context).getText(
                                        '5o7o32pr' /* 3. Расшифровка */,
                                      ),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '4vgfp744' /* Речь преобразуется в текст для... */,
                                      ),
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              if (_model.captureStage == 'transcribing')
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ocnhu63h' /* Текущий */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.nunito(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          if (_model.captureStage == 'transcribing')
                            LinearPercentIndicator(
                              percent: 0.0,
                              width: 28.0,
                              lineHeight: 3.0,
                              animation: false,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).accent2,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              padding: EdgeInsets.zero,
                            ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                if (_model.captureStage == 'analysis')
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.schema,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 20.0,
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
                                      FFLocalizations.of(context).getText(
                                        'yzturet9' /* 4. Разбор */,
                                      ),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'd5djhmaw' /* ИИ выделяет задачи, сущности и... */,
                                      ),
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              if (_model.captureStage == 'analysis')
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'qvy4x593' /* Текущий */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.nunito(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          if (_model.captureStage == 'transcribing')
                            LinearPercentIndicator(
                              percent: 0.0,
                              width: 28.0,
                              lineHeight: 3.0,
                              animation: false,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).accent2,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              padding: EdgeInsets.zero,
                            ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                if (_model.captureStage == 'ready')
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.task_alt,
                                  color: FlutterFlowTheme.of(context).success,
                                  size: 20.0,
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
                                      FFLocalizations.of(context).getText(
                                        'upxt6x9q' /* 5. Готово к проверке */,
                                      ),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'zv1aoan2' /* Откройте извлечённый результат... */,
                                      ),
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              if (_model.captureStage == 'ready')
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '52grsmgn' /* Текущий */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.nunito(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          if (_model.captureStage == 'ready')
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).success,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '37irc6e0' /* Задачи готовы к проверке! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.nunito(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context
                                        .pushNamed(InboxPageWidget.routeName);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '0kreze2d' /* Проверить задачи */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 42.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context
                                        .pushNamed(TasksPageWidget.routeName);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'h6bxfzsb' /* Назад к задачам */,
                                  ),
                                  options: FFButtonOptions(
                                    height: 42.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                if (_model.captureStage == 'error')
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.error_outline,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 20.0,
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
                                      FFLocalizations.of(context).getText(
                                        'muu8fd5v' /* 6. Ошибка */,
                                      ),
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'jcwa841n' /* Если загрузка или обработка ИИ... */,
                                      ),
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              if (_model.captureStage == 'error')
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '2ogvfe1z' /* Текущий */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.nunito(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (_model.captureStage == 'error')
                                Text(
                                  _model.captureError!,
                                  maxLines: 3,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.captureStage = 'recording';
                                  safeSetState(() {});
                                  _model.captureError = '';
                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  '4fx1sd5y' /* Повторить захват */,
                                ),
                                options: FFButtonOptions(
                                  height: 42.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}

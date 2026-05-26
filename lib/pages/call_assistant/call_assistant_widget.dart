import '/component/ai_suggestion/ai_suggestion_widget.dart';
import '/component/transcript_item/transcript_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'call_assistant_model.dart';
export 'call_assistant_model.dart';

class CallAssistantWidget extends StatefulWidget {
  const CallAssistantWidget({super.key});

  static String routeName = 'CallAssistant';
  static String routePath = '/callAssistant';

  @override
  State<CallAssistantWidget> createState() => _CallAssistantWidgetState();
}

class _CallAssistantWidgetState extends State<CallAssistantWidget> {
  late CallAssistantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallAssistantModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 240.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: Color(0xFF22D3EE),
            icon: Icon(
              Icons.auto_awesome_rounded,
              color: Colors.black,
            ),
            label: Text(
              FFLocalizations.of(context).getText(
                'rpq4ssd3' /* Ассистент активен */,
              ),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF141414),
                        border: Border.all(
                          color: Color(0xFF1A1A1A),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).divider,
                              borderRadius: 4.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(HomePageWidget.routeName);
                              },
                            ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          borderRadius:
                                              BorderRadius.circular(9999.0),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'd6fgxt62' /* В ЭФИРЕ • 04:12 */,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
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
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'omhf3y6e' /* Переговоры: Техническое задани... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.jetBrainsMono(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF7C809C),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).divider,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.graphic_eq_rounded,
                                  color: Color(0xFF22D3EE),
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 6.0)),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 20.0, 24.0, 32.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  wrapWithModel(
                                    model: _model.transcriptItemModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TranscriptItemWidget(
                                      isUser: false,
                                      sender: 'Клиент',
                                      time: '14:10',
                                      text:
                                          'Нам нужно внедрить поддержку API к следующему вторнику. Это критично для запуска.',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.transcriptItemModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TranscriptItemWidget(
                                      isUser: true,
                                      sender: 'Вы',
                                      time: '14:11',
                                      text:
                                          'Я уточню у команды разработки, сможем ли мы сдвинуть спринт.',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1A1A1A),
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        border: Border.all(
                                          color: Color(0xFF333333),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.psychology_rounded,
                                                  color: Color(0xFFF472B6),
                                                  size: 20.0,
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'phuetuan' /* ИИ-АНАЛИЗ КОНТЕКСТА */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .jetBrainsMono(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFF472B6),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w39htwg0' /* Обнаружено обязательство: уточ... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .jetBrainsMono(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                        lineHeight: 1.4,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.transcriptItemModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TranscriptItemWidget(
                                      isUser: false,
                                      sender: 'Клиент',
                                      time: '14:12',
                                      text:
                                          'Хорошо, жду ответа. Также подготовьте смету на дополнительные часы.',
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 2.0,
                                        height: 18.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF22D3EE),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '8u5xhzf8' /* Ассистент записывает... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .hint,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 230.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF141414),
                      border: Border.all(
                        color: Color(0xFF1A1A1A),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'egi7mfjt' /* ПРЕДЛОЖЕНИЯ АССИСТЕНТА */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.jetBrainsMono(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).hint,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                        lineHeight: 1.2,
                                      ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      wrapWithModel(
                                        model: _model.aiSuggestionModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AiSuggestionWidget(
                                          icon: 'add_task_rounded',
                                          label: 'Создать задачу: Смета',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.aiSuggestionModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AiSuggestionWidget(
                                          icon: 'event_available_rounded',
                                          label: 'Встреча во вторник',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.aiSuggestionModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AiSuggestionWidget(
                                          icon: 'auto_fix_high_rounded',
                                          label: 'Сгенерировать ответ',
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 0.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 48.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.mic_off_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'w7re0y46' /* Без звука */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.jetBrainsMono(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64.0,
                                    height: 64.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).error,
                                      borderRadius:
                                          BorderRadius.circular(9999.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.call_end_rounded,
                                      color: Colors.white,
                                      size: 32.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'bnkigl9f' /* Завершить */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.jetBrainsMono(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 48.0,
                                    fillColor: Color(0xFF22D3EE),
                                    icon: Icon(
                                      Icons.smart_toy_rounded,
                                      color: Colors.black,
                                      size: 32.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'qb95f0lo' /* ИИ-Режим */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.jetBrainsMono(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF22D3EE),
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(2.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).divider,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_voice_rounded,
                                    color: FlutterFlowTheme.of(context).hint,
                                    size: 20.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      enabled: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .hint,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 1.5,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'tuf7ked4' /* Шепнуть ассистенту... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.dmSans(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      enableInteractiveSelection: true,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.send_rounded,
                                    color: Color(0xFF22D3EE),
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ].addToEnd(SizedBox(height: 12.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

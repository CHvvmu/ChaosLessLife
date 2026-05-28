import '/component/chat_tab/chat_tab_widget.dart';
import '/component/message_item/message_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'a3_a_i_messaging_hub_model.dart';
export 'a3_a_i_messaging_hub_model.dart';

class A3AIMessagingHubWidget extends StatefulWidget {
  const A3AIMessagingHubWidget({super.key});

  static String routeName = 'A3_AIMessagingHub';
  static String routePath = '/a3AIMessagingHub';

  @override
  State<A3AIMessagingHubWidget> createState() => _A3AIMessagingHubWidgetState();
}

class _A3AIMessagingHubWidgetState extends State<A3AIMessagingHubWidget> {
  late A3AIMessagingHubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => A3AIMessagingHubModel());

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
      floatingActionButton: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 100.0),
          child: FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: Color(0xFF22D3EE),
            child: Icon(
              Icons.mic_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 20.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'zffjn4on' /* Жизнь без хаоса */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.jetBrainsMono(
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'v747rd30' /* ИИ-Ассистент активен */,
                                        ),
                                        style: TextStyle(
                                          color: Color(0xFF4ADE80),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '20s5vmdg' /* ЦЕНТР СООБЩЕНИЙ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.nunito(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 8.0,
                                            height: 8.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'wl2905q5' /* 2 задачи извлечены */,
                                            ),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'i3tauztj' /* Спросить AI */,
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                          Container(
                            width: 45.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: FlutterFlowIconButton(
                              borderRadius: 4.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.tune_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.chatTabModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: ChatTabWidget(
                                selected: true,
                                label: 'Все (12)',
                              ),
                            ),
                            wrapWithModel(
                              model: _model.chatTabModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: ChatTabWidget(
                                selected: false,
                                label: 'Telegram',
                              ),
                            ),
                            wrapWithModel(
                              model: _model.chatTabModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: ChatTabWidget(
                                selected: false,
                                label: 'WhatsApp',
                              ),
                            ),
                            wrapWithModel(
                              model: _model.chatTabModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: ChatTabWidget(
                                selected: false,
                                label: 'Slack',
                              ),
                            ),
                            wrapWithModel(
                              model: _model.chatTabModel5,
                              updateCallback: () => safeSetState(() {}),
                              child: ChatTabWidget(
                                selected: false,
                                label: 'Email',
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'oemeso4l' /* ТРЕБУЮТ ВНИМАНИЯ */,
                              ),
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontWeight: FontWeight.w800,
                                fontSize: 11.0,
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.messageItemModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: MessageItemWidget(
                              platform: 'telegram',
                              sender: 'Игорь Волков',
                              time: '2 мин назад',
                              priority: 'СРОЧНО',
                              message:
                                  'Привет! Нам нужно утвердить смету по проекту \'Сириус\' до 14:00. Сможешь посмотреть?',
                              draft:
                                  'Привет, Игорь! Да, я сейчас ознакомлюсь со сметой и пришлю подтверждение в течение 15 минут.',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.messageItemModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: MessageItemWidget(
                              platform: 'slack',
                              sender: 'Анна (HR)',
                              time: '15 мин назад',
                              priority: 'СРЕДНИЙ',
                              message:
                                  'Алексей, когда будет готов фидбек по кандидату на позицию Lead Developer?',
                              draft:
                                  'Анна, добрый день! Заканчиваю анализ интервью, отправлю подробный отзыв до конца рабочего дня.',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.messageItemModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: MessageItemWidget(
                              platform: 'whatsapp',
                              sender: 'Клиент: ТехноПром',
                              time: '1 час назад',
                              priority: 'ВАЖНО',
                              message:
                                  'Мы решили перенести встречу на четверг, 11:00. Вам удобно?',
                              draft:
                                  'Здравствуйте! Четверг в 11:00 подходит. Я внес встречу в календарь и выслал приглашение.',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
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
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.mic_none_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'xrzjtd7g' /* Голосовой ответ или команда... */,
                                      ),
                                      style: TextStyle(
                                        color:
                                            FlutterFlowTheme.of(context).hint,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.auto_fix_high_rounded,
                            color: FlutterFlowTheme.of(context).info,
                            size: 22.0,
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
              ].addToEnd(SizedBox(height: 50.0)),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.robot,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(HomePageWidget.routeName);
                      },
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.solidCalendarAlt,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(TasksPageWidget.routeName);
                      },
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.commentAlt,
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.call,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(CallAssistantWidget.routeName);
                      },
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.settings_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(UserSettingsWidget.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

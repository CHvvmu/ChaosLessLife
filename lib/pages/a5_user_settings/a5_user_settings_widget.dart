import '/component/group_header/group_header_widget.dart';
import '/component/profile_card/profile_card_widget.dart';
import '/component/settings_item/settings_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'a5_user_settings_model.dart';
export 'a5_user_settings_model.dart';

class A5UserSettingsWidget extends StatefulWidget {
  const A5UserSettingsWidget({super.key});

  static String routeName = 'A5_UserSettings';
  static String routePath = '/a5UserSettings';

  @override
  State<A5UserSettingsWidget> createState() => _A5UserSettingsWidgetState();
}

class _A5UserSettingsWidgetState extends State<A5UserSettingsWidget> {
  late A5UserSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => A5UserSettingsModel());

    _model.darkModeSwitchValue = FFAppState().isDarkMode;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'siwd7nkf' /* Жизнь без хаоса */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.jetBrainsMono(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'dccbqllk' /* НАСТРОЙКИ */,
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ],
                        ),
                        FlutterFlowIconButton(
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.help_outline_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
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
                wrapWithModel(
                  model: _model.profileCardModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ProfileCardWidget(
                    name: 'Александр Иванов',
                    role: 'Project Manager',
                  ),
                ),
                wrapWithModel(
                  model: _model.appearanceSectionHeaderModel,
                  updateCallback: () => safeSetState(() {}),
                  child: GroupHeaderWidget(
                    title: 'Оформление',
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 16.0, 14.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 36.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.dark_mode,
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
                                  'v5z3knwq' /* Тёмный режим */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'sapxwjot' /* Переключить тему приложения */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 2.0)),
                          ),
                        ),
                        Switch(
                          value: _model.darkModeSwitchValue!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.darkModeSwitchValue = newValue);
                            if (newValue) {
                              FFAppState().isDarkMode =
                                  _model.darkModeSwitchValue!;
                              safeSetState(() {});
                              if (_model.darkModeSwitchValue!) {
                                setDarkModeSetting(context, ThemeMode.dark);
                              } else {
                                setDarkModeSetting(context, ThemeMode.light);
                              }
                            } else {
                              FFAppState().isDarkMode =
                                  _model.darkModeSwitchValue!;
                              safeSetState(() {});
                              if (_model.darkModeSwitchValue!) {
                                setDarkModeSetting(context, ThemeMode.dark);
                              } else {
                                setDarkModeSetting(context, ThemeMode.light);
                              }
                            }
                          },
                          activeThumbColor: FlutterFlowTheme.of(context).primary,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(BehaviorTimelinePageWidget.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 14.0, 16.0, 14.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 36.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.timeline_rounded,
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
                                    'r9btbqpg' /* История действий */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        font: GoogleFonts.dmSans(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ahbvnsm9' /* Журнал событий */,
                                  ),
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 2.0)),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.groupHeaderModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: GroupHeaderWidget(
                    title: 'ИНТЕРФЕЙС И ИИ',
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'language_rounded',
                    title: 'Язык приложения',
                    subtitle: 'Смена RU/EN',
                    hasSubtitle: true,
                    value: 'Русский',
                    hasValue: true,
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'record_voice_over_rounded',
                    title: 'Голос ассистента',
                    subtitle: 'Выбор тембра и скорости',
                    hasSubtitle: true,
                    value: 'Максим (AI)',
                    hasValue: true,
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'psychology_rounded',
                    title: 'Активация голосом',
                    subtitle: 'Эй, Ассистент',
                    hasSubtitle: true,
                    isToggle: 'true',
                    toggleValue: 'true',
                  ),
                ),
                wrapWithModel(
                  model: _model.groupHeaderModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: GroupHeaderWidget(
                    title: 'БЕЗОПАСНОСТЬ',
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'lock_outline_rounded',
                    title: 'Параметры конфиденциальности',
                    subtitle: 'Доступ к звонкам и контактам',
                    hasSubtitle: true,
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'fingerprint_rounded',
                    title: 'Биометрия',
                    subtitle: 'Вход по FaceID/TouchID',
                    hasSubtitle: true,
                    isToggle: 'true',
                    toggleValue: 'true',
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'shield_rounded',
                    title: 'Шифрование данных',
                    subtitle: 'Защита по 152-ФЗ',
                    hasSubtitle: true,
                    value: 'Включено',
                    hasValue: true,
                  ),
                ),
                wrapWithModel(
                  model: _model.groupHeaderModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: GroupHeaderWidget(
                    title: 'ИНТЕГРАЦИИ',
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel7,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'sync_rounded',
                    title: 'Синхронизация CRM',
                    subtitle: 'Bitrix24, amoCRM',
                    hasSubtitle: true,
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel8,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'calendar_today_rounded',
                    title: 'Календари',
                    subtitle: 'Google, Apple, Outlook',
                    hasSubtitle: true,
                    value: '3 активных',
                    hasValue: true,
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel9,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'alternate_email_rounded',
                    title: 'Мессенджеры',
                    subtitle: 'Telegram, WhatsApp, Slack',
                    hasSubtitle: true,
                  ),
                ),
                wrapWithModel(
                  model: _model.groupHeaderModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: GroupHeaderWidget(
                    title: 'УВЕДОМЛЕНИЯ',
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel10,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'notifications_none_rounded',
                    title: 'Push-уведомления',
                    isToggle: 'true',
                    toggleValue: 'true',
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel11,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'assignment_late_rounded',
                    title: 'Отчеты по итогам звонков',
                    isToggle: 'true',
                    toggleValue: 'true',
                  ),
                ),
                wrapWithModel(
                  model: _model.groupHeaderModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: GroupHeaderWidget(
                    title: 'ХРАНИЛИЩЕ',
                  ),
                ),
                wrapWithModel(
                  model: _model.settingsItemModel12,
                  updateCallback: () => safeSetState(() {}),
                  child: SettingsItemWidget(
                    icon: 'storage_rounded',
                    title: 'Записи звонков',
                    subtitle: 'Использовано 1.2 ГБ из 10 ГБ',
                    hasSubtitle: true,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LinearPercentIndicator(
                          percent: 0.12,
                          lineHeight: 4.0,
                          animation: false,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor: FlutterFlowTheme.of(context).divider,
                          barRadius: Radius.circular(2.0),
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '0mjimp1n' /* Очистить кэш (240 МБ) */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    font: GoogleFonts.jetBrainsMono(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                    lineHeight: 1.3,
                                  ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'sm22yqjz' /* Жизнь без хаоса v2.4.0 */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
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
                        Text(
                          FFLocalizations.of(context).getText(
                            '7cq03enw' /* Сделано с помощью ИИ */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
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
                ),
                Container(
                  height: 40.0,
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiary,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).tertiary,
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
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(A3AIMessagingHubWidget.routeName);
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
                        color: FlutterFlowTheme.of(context).accent1,
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
          ),
        ],
      ),
    );
  }
}

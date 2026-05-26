import '/component/insight_card2/insight_card2_widget.dart';
import '/component/legend_item/legend_item_widget.dart';
import '/component/metric_card2/metric_card2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'a4_analytics_model.dart';
export 'a4_analytics_model.dart';

class A4AnalyticsWidget extends StatefulWidget {
  const A4AnalyticsWidget({super.key});

  static String routeName = 'A4_Analytics';
  static String routePath = '/a4Analytics';

  @override
  State<A4AnalyticsWidget> createState() => _A4AnalyticsWidgetState();
}

class _A4AnalyticsWidgetState extends State<A4AnalyticsWidget> {
  late A4AnalyticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => A4AnalyticsModel());

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
                            Text(
                              FFLocalizations.of(context).getText(
                                'gtg7n9uo' /* Жизнь без хаоса */,
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
                                'g08zqjy8' /* АНАЛИТИКА */,
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
                                    lineHeight: 1.2,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'kh6l0jnj' /* Связь настроения и задач */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                        FlutterFlowIconButton(
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.insights_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 28.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.metricCard2Model1,
                          updateCallback: () => safeSetState(() {}),
                          child: MetricCard2Widget(
                            label: 'Завершено задач',
                            value: 42.0,
                            trend: 12.0,
                            color: FlutterFlowTheme.of(context).success,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.metricCard2Model2,
                          updateCallback: () => safeSetState(() {}),
                          child: MetricCard2Widget(
                            label: 'Средний фокус',
                            value: 5.4,
                            trend: 15.0,
                            color: FlutterFlowTheme.of(context).error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).divider,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'fb3hshio' /* Продуктивность/Настроение */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                                lineHeight: 1.3,
                                              ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .divider,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 8.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.event_note_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 14.0,
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'tjh5dl4n' /* Неделя */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .jetBrainsMono(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'dnihjdaa' /* Тренд за последние 7 дней */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                font: GoogleFonts.jetBrainsMono(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 12.0,
                                          height: 4.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'cugg8dt1' /* Задачи */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                font: GoogleFonts.jetBrainsMono(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 12.0,
                                          height: 4.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'xobat00n' /* Настроение */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                font: GoogleFonts.jetBrainsMono(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                  ].divide(SizedBox(width: 24.0)),
                                ),
                                Container(
                                  height: 240.0,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 273.7,
                                        height: 283.51,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'ia44usok' /* Ваши состояния */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
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
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).divider,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 140.0,
                                  height: 140.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      wrapWithModel(
                                        model: _model.legendItemModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LegendItemWidget(
                                          dotColor: FlutterFlowTheme.of(context)
                                              .success,
                                          label: '45% Энергичность',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.legendItemModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LegendItemWidget(
                                          dotColor: FlutterFlowTheme.of(context)
                                              .primary,
                                          label: '30% Фокус',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.legendItemModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LegendItemWidget(
                                          dotColor: FlutterFlowTheme.of(context)
                                              .accent1,
                                          label: '15% Усталость',
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.legendItemModel4,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: LegendItemWidget(
                                          dotColor: FlutterFlowTheme.of(context)
                                              .error,
                                          label: '10% Стресс',
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 24.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'kncmiph9' /* Инсайты Лины */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.3,
                                  ),
                            ),
                            Container(
                              width: 100.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: Color(0x22D3EE22),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  width: 1.0,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '1k03i9xs' /* AI Анализ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.dmSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.insightCard2Model1,
                              updateCallback: () => safeSetState(() {}),
                              child: InsightCard2Widget(
                                bg: Color(0x1522C55E),
                                icon: 'psychology_rounded',
                                iconColor: FlutterFlowTheme.of(context).success,
                                title: 'Эффект настроения',
                                desc:
                                    'Ваша продуктивность вырастает на 32%, если утро начинается с позитивного чек-ина.',
                              ),
                            ),
                            wrapWithModel(
                              model: _model.insightCard2Model2,
                              updateCallback: () => safeSetState(() {}),
                              child: InsightCard2Widget(
                                bg: Color(0x1522D3EE),
                                icon: 'battery_charging_full_rounded',
                                iconColor: FlutterFlowTheme.of(context).accent1,
                                title: 'Режим супер-фокуса',
                                desc:
                                    'В среду вы работали 4 часа без пауз. Лина рекомендует добавить 15 мин отдыха завтра.',
                              ),
                            ),
                            wrapWithModel(
                              model: _model.insightCard2Model3,
                              updateCallback: () => safeSetState(() {}),
                              child: InsightCard2Widget(
                                bg: Color(0x156B7280),
                                icon: 'calendar_month_rounded',
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                title: 'Планирование',
                                desc:
                                    'Четверг — ваш самый спокойный день. Идеально для глубокой творческой работы.',
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: FFLocalizations.of(context).getText(
                          'snhx8aqq' /* Обсудить аналитику с Линой */,
                        ),
                        icon: Icon(
                          Icons.chat_bubble_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: TextStyle(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ].addToEnd(SizedBox(height: 30.0)),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
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
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.solidCalendarAlt,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.commentAlt,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.chartLine,
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
                        Icons.settings_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
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

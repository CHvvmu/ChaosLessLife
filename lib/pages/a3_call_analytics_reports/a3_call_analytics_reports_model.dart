import '/component/entity_tag/entity_tag_widget.dart';
import '/component/metric_card/metric_card_widget.dart';
import '/component/sentiment_badge/sentiment_badge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a3_call_analytics_reports_widget.dart'
    show A3CallAnalyticsReportsWidget;
import 'package:flutter/material.dart';

class A3CallAnalyticsReportsModel
    extends FlutterFlowModel<A3CallAnalyticsReportsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SentimentBadge component.
  late SentimentBadgeModel sentimentBadgeModel;
  // Model for MetricCard component.
  late MetricCardModel metricCardModel1;
  // Model for MetricCard component.
  late MetricCardModel metricCardModel2;
  // Model for MetricCard component.
  late MetricCardModel metricCardModel3;
  // Model for EntityTag component.
  late EntityTagModel entityTagModel1;
  // Model for EntityTag component.
  late EntityTagModel entityTagModel2;
  // Model for EntityTag component.
  late EntityTagModel entityTagModel3;
  // Model for EntityTag component.
  late EntityTagModel entityTagModel4;

  @override
  void initState(BuildContext context) {
    sentimentBadgeModel = createModel(context, () => SentimentBadgeModel());
    metricCardModel1 = createModel(context, () => MetricCardModel());
    metricCardModel2 = createModel(context, () => MetricCardModel());
    metricCardModel3 = createModel(context, () => MetricCardModel());
    entityTagModel1 = createModel(context, () => EntityTagModel());
    entityTagModel2 = createModel(context, () => EntityTagModel());
    entityTagModel3 = createModel(context, () => EntityTagModel());
    entityTagModel4 = createModel(context, () => EntityTagModel());
  }

  @override
  void dispose() {
    sentimentBadgeModel.dispose();
    metricCardModel1.dispose();
    metricCardModel2.dispose();
    metricCardModel3.dispose();
    entityTagModel1.dispose();
    entityTagModel2.dispose();
    entityTagModel3.dispose();
    entityTagModel4.dispose();
  }
}

import '/component/insight_card2/insight_card2_widget.dart';
import '/component/legend_item/legend_item_widget.dart';
import '/component/metric_card2/metric_card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a4_analytics_widget.dart' show A4AnalyticsWidget;
import 'package:flutter/material.dart';

class A4AnalyticsModel extends FlutterFlowModel<A4AnalyticsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MetricCard2 component.
  late MetricCard2Model metricCard2Model1;
  // Model for MetricCard2 component.
  late MetricCard2Model metricCard2Model2;
  // Model for LegendItem component.
  late LegendItemModel legendItemModel1;
  // Model for LegendItem component.
  late LegendItemModel legendItemModel2;
  // Model for LegendItem component.
  late LegendItemModel legendItemModel3;
  // Model for LegendItem component.
  late LegendItemModel legendItemModel4;
  // Model for InsightCard2 component.
  late InsightCard2Model insightCard2Model1;
  // Model for InsightCard2 component.
  late InsightCard2Model insightCard2Model2;
  // Model for InsightCard2 component.
  late InsightCard2Model insightCard2Model3;

  @override
  void initState(BuildContext context) {
    metricCard2Model1 = createModel(context, () => MetricCard2Model());
    metricCard2Model2 = createModel(context, () => MetricCard2Model());
    legendItemModel1 = createModel(context, () => LegendItemModel());
    legendItemModel2 = createModel(context, () => LegendItemModel());
    legendItemModel3 = createModel(context, () => LegendItemModel());
    legendItemModel4 = createModel(context, () => LegendItemModel());
    insightCard2Model1 = createModel(context, () => InsightCard2Model());
    insightCard2Model2 = createModel(context, () => InsightCard2Model());
    insightCard2Model3 = createModel(context, () => InsightCard2Model());
  }

  @override
  void dispose() {
    metricCard2Model1.dispose();
    metricCard2Model2.dispose();
    legendItemModel1.dispose();
    legendItemModel2.dispose();
    legendItemModel3.dispose();
    legendItemModel4.dispose();
    insightCard2Model1.dispose();
    insightCard2Model2.dispose();
    insightCard2Model3.dispose();
  }
}

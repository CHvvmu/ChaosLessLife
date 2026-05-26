import '/component/integration_card/integration_card_widget.dart';
import '/component/section_header/section_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a5_integrations_c_r_m_widget.dart' show A5IntegrationsCRMWidget;
import 'package:flutter/material.dart';

class A5IntegrationsCRMModel extends FlutterFlowModel<A5IntegrationsCRMWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SectionHeader component.
  late SectionHeaderModel sectionHeaderModel1;
  // Model for IntegrationCard component.
  late IntegrationCardModel integrationCardModel1;
  // Model for IntegrationCard component.
  late IntegrationCardModel integrationCardModel2;
  // Model for IntegrationCard component.
  late IntegrationCardModel integrationCardModel3;
  // Model for SectionHeader component.
  late SectionHeaderModel sectionHeaderModel2;
  // Model for IntegrationCard component.
  late IntegrationCardModel integrationCardModel4;
  // Model for IntegrationCard component.
  late IntegrationCardModel integrationCardModel5;
  // Model for SectionHeader component.
  late SectionHeaderModel sectionHeaderModel3;
  // Model for IntegrationCard component.
  late IntegrationCardModel integrationCardModel6;
  // Model for IntegrationCard component.
  late IntegrationCardModel integrationCardModel7;

  @override
  void initState(BuildContext context) {
    sectionHeaderModel1 = createModel(context, () => SectionHeaderModel());
    integrationCardModel1 = createModel(context, () => IntegrationCardModel());
    integrationCardModel2 = createModel(context, () => IntegrationCardModel());
    integrationCardModel3 = createModel(context, () => IntegrationCardModel());
    sectionHeaderModel2 = createModel(context, () => SectionHeaderModel());
    integrationCardModel4 = createModel(context, () => IntegrationCardModel());
    integrationCardModel5 = createModel(context, () => IntegrationCardModel());
    sectionHeaderModel3 = createModel(context, () => SectionHeaderModel());
    integrationCardModel6 = createModel(context, () => IntegrationCardModel());
    integrationCardModel7 = createModel(context, () => IntegrationCardModel());
  }

  @override
  void dispose() {
    sectionHeaderModel1.dispose();
    integrationCardModel1.dispose();
    integrationCardModel2.dispose();
    integrationCardModel3.dispose();
    sectionHeaderModel2.dispose();
    integrationCardModel4.dispose();
    integrationCardModel5.dispose();
    sectionHeaderModel3.dispose();
    integrationCardModel6.dispose();
    integrationCardModel7.dispose();
  }
}

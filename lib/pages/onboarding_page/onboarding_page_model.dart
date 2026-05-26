import '/component/feature_card/feature_card_widget.dart';
import '/component/step_indicator/step_indicator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_page_widget.dart' show OnboardingPageWidget;
import 'package:flutter/material.dart';

class OnboardingPageModel extends FlutterFlowModel<OnboardingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FeatureCard component.
  late FeatureCardModel featureCardModel1;
  // Model for FeatureCard component.
  late FeatureCardModel featureCardModel2;
  // Model for FeatureCard component.
  late FeatureCardModel featureCardModel3;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for StepIndicator component.
  late StepIndicatorModel stepIndicatorModel1;
  // Model for StepIndicator component.
  late StepIndicatorModel stepIndicatorModel2;
  // Model for StepIndicator component.
  late StepIndicatorModel stepIndicatorModel3;

  @override
  void initState(BuildContext context) {
    featureCardModel1 = createModel(context, () => FeatureCardModel());
    featureCardModel2 = createModel(context, () => FeatureCardModel());
    featureCardModel3 = createModel(context, () => FeatureCardModel());
    stepIndicatorModel1 = createModel(context, () => StepIndicatorModel());
    stepIndicatorModel2 = createModel(context, () => StepIndicatorModel());
    stepIndicatorModel3 = createModel(context, () => StepIndicatorModel());
  }

  @override
  void dispose() {
    featureCardModel1.dispose();
    featureCardModel2.dispose();
    featureCardModel3.dispose();
    stepIndicatorModel1.dispose();
    stepIndicatorModel2.dispose();
    stepIndicatorModel3.dispose();
  }
}

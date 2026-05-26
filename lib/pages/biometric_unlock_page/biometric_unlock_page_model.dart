import '/component/bio_action/bio_action_widget.dart';
import '/component/num_key/num_key_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'biometric_unlock_page_widget.dart' show BiometricUnlockPageWidget;
import 'package:flutter/material.dart';

class BiometricUnlockPageModel
    extends FlutterFlowModel<BiometricUnlockPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NumKey component.
  late NumKeyModel numKeyModel1;
  // Model for NumKey component.
  late NumKeyModel numKeyModel2;
  // Model for NumKey component.
  late NumKeyModel numKeyModel3;
  // Model for NumKey component.
  late NumKeyModel numKeyModel4;
  // Model for NumKey component.
  late NumKeyModel numKeyModel5;
  // Model for NumKey component.
  late NumKeyModel numKeyModel6;
  // Model for NumKey component.
  late NumKeyModel numKeyModel7;
  // Model for NumKey component.
  late NumKeyModel numKeyModel8;
  // Model for NumKey component.
  late NumKeyModel numKeyModel9;
  // Model for NumKey component.
  late NumKeyModel numKeyModel10;
  // Model for BioAction component.
  late BioActionModel bioActionModel1;
  // Model for BioAction component.
  late BioActionModel bioActionModel2;

  @override
  void initState(BuildContext context) {
    numKeyModel1 = createModel(context, () => NumKeyModel());
    numKeyModel2 = createModel(context, () => NumKeyModel());
    numKeyModel3 = createModel(context, () => NumKeyModel());
    numKeyModel4 = createModel(context, () => NumKeyModel());
    numKeyModel5 = createModel(context, () => NumKeyModel());
    numKeyModel6 = createModel(context, () => NumKeyModel());
    numKeyModel7 = createModel(context, () => NumKeyModel());
    numKeyModel8 = createModel(context, () => NumKeyModel());
    numKeyModel9 = createModel(context, () => NumKeyModel());
    numKeyModel10 = createModel(context, () => NumKeyModel());
    bioActionModel1 = createModel(context, () => BioActionModel());
    bioActionModel2 = createModel(context, () => BioActionModel());
  }

  @override
  void dispose() {
    numKeyModel1.dispose();
    numKeyModel2.dispose();
    numKeyModel3.dispose();
    numKeyModel4.dispose();
    numKeyModel5.dispose();
    numKeyModel6.dispose();
    numKeyModel7.dispose();
    numKeyModel8.dispose();
    numKeyModel9.dispose();
    numKeyModel10.dispose();
    bioActionModel1.dispose();
    bioActionModel2.dispose();
  }
}

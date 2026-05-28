import '/component/group_header/group_header_widget.dart';
import '/component/profile_card/profile_card_widget.dart';
import '/component/settings_item/settings_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_settings_widget.dart' show UserSettingsWidget;
import 'package:flutter/material.dart';

class UserSettingsModel extends FlutterFlowModel<UserSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileCard component.
  late ProfileCardModel profileCardModel;
  // Model for AppearanceSectionHeader.
  late GroupHeaderModel appearanceSectionHeaderModel;
  // State field(s) for DarkModeSwitch widget.
  bool? darkModeSwitchValue;
  // Model for GroupHeader component.
  late GroupHeaderModel groupHeaderModel1;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel1;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel2;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel3;
  // Model for GroupHeader component.
  late GroupHeaderModel groupHeaderModel2;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel4;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel5;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel6;
  // Model for GroupHeader component.
  late GroupHeaderModel groupHeaderModel3;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel7;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel8;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel9;
  // Model for GroupHeader component.
  late GroupHeaderModel groupHeaderModel4;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel10;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel11;
  // Model for GroupHeader component.
  late GroupHeaderModel groupHeaderModel5;
  // Model for SettingsItem component.
  late SettingsItemModel settingsItemModel12;

  @override
  void initState(BuildContext context) {
    profileCardModel = createModel(context, () => ProfileCardModel());
    appearanceSectionHeaderModel =
        createModel(context, () => GroupHeaderModel());
    groupHeaderModel1 = createModel(context, () => GroupHeaderModel());
    settingsItemModel1 = createModel(context, () => SettingsItemModel());
    settingsItemModel2 = createModel(context, () => SettingsItemModel());
    settingsItemModel3 = createModel(context, () => SettingsItemModel());
    groupHeaderModel2 = createModel(context, () => GroupHeaderModel());
    settingsItemModel4 = createModel(context, () => SettingsItemModel());
    settingsItemModel5 = createModel(context, () => SettingsItemModel());
    settingsItemModel6 = createModel(context, () => SettingsItemModel());
    groupHeaderModel3 = createModel(context, () => GroupHeaderModel());
    settingsItemModel7 = createModel(context, () => SettingsItemModel());
    settingsItemModel8 = createModel(context, () => SettingsItemModel());
    settingsItemModel9 = createModel(context, () => SettingsItemModel());
    groupHeaderModel4 = createModel(context, () => GroupHeaderModel());
    settingsItemModel10 = createModel(context, () => SettingsItemModel());
    settingsItemModel11 = createModel(context, () => SettingsItemModel());
    groupHeaderModel5 = createModel(context, () => GroupHeaderModel());
    settingsItemModel12 = createModel(context, () => SettingsItemModel());
  }

  @override
  void dispose() {
    profileCardModel.dispose();
    appearanceSectionHeaderModel.dispose();
    groupHeaderModel1.dispose();
    settingsItemModel1.dispose();
    settingsItemModel2.dispose();
    settingsItemModel3.dispose();
    groupHeaderModel2.dispose();
    settingsItemModel4.dispose();
    settingsItemModel5.dispose();
    settingsItemModel6.dispose();
    groupHeaderModel3.dispose();
    settingsItemModel7.dispose();
    settingsItemModel8.dispose();
    settingsItemModel9.dispose();
    groupHeaderModel4.dispose();
    settingsItemModel10.dispose();
    settingsItemModel11.dispose();
    groupHeaderModel5.dispose();
    settingsItemModel12.dispose();
  }
}

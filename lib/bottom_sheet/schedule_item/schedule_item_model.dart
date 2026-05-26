import '/bottom_sheet/energy_badge/energy_badge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'schedule_item_widget.dart' show ScheduleItemWidget;
import 'package:flutter/material.dart';

class ScheduleItemModel extends FlutterFlowModel<ScheduleItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EnergyBadge component.
  late EnergyBadgeModel energyBadgeModel;

  @override
  void initState(BuildContext context) {
    energyBadgeModel = createModel(context, () => EnergyBadgeModel());
  }

  @override
  void dispose() {
    energyBadgeModel.dispose();
  }
}

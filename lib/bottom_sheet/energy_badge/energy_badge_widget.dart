import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'energy_badge_model.dart';
export 'energy_badge_model.dart';

class EnergyBadgeWidget extends StatefulWidget {
  const EnergyBadgeWidget({
    super.key,
    this.level,
  });

  final String? level;

  @override
  State<EnergyBadgeWidget> createState() => _EnergyBadgeWidgetState();
}

class _EnergyBadgeWidgetState extends State<EnergyBadgeWidget> {
  late EnergyBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnergyBadgeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: () {
          if (widget.level == 'High') {
            return Color(0xFFFEE2E2);
          } else if (widget.level == 'Medium') {
            return Color(0xFFFEF3C7);
          } else {
            return Color(0xFFDCFCE7);
          }
        }(),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
        child: Text(
          valueOrDefault<String>(
            widget.level,
            'High',
          ),
          style: FlutterFlowTheme.of(context).labelSmall.override(
                font: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                ),
                color: () {
                  if (widget.level == 'High') {
                    return Color(0xFF991B1B);
                  } else if (widget.level == 'Medium') {
                    return Color(0xFF92400E);
                  } else {
                    return Color(0xFF166534);
                  }
                }(),
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
              ),
        ),
      ),
    );
  }
}

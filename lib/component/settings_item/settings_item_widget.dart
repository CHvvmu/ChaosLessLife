import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings_item_model.dart';
export 'settings_item_model.dart';

class SettingsItemWidget extends StatefulWidget {
  const SettingsItemWidget({
    super.key,
    this.icon,
    this.title,
    this.subtitle,
    this.hasSubtitle,
    this.isToggle,
    this.toggleValue,
    this.value,
    this.hasValue,
  });

  final String? icon;
  final String? title;
  final String? subtitle;
  final bool? hasSubtitle;
  final String? isToggle;
  final String? toggleValue;
  final String? value;
  final bool? hasValue;

  @override
  State<SettingsItemWidget> createState() => _SettingsItemWidgetState();
}

class _SettingsItemWidgetState extends State<SettingsItemWidget> {
  late SettingsItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsItemModel());

    _model.switchValue = false;
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 36.0,
              height: 36.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(4.0),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.language_rounded,
                color: FlutterFlowTheme.of(context).primary,
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
                    valueOrDefault<String>(
                      widget.title,
                      'Язык приложения',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          lineHeight: 1.5,
                        ),
                  ),
                  if (widget.hasSubtitle ?? true)
                    Text(
                      valueOrDefault<String>(
                        widget.subtitle,
                        'Смена RU/EN',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                            lineHeight: 1.2,
                          ),
                    ),
                ].divide(SizedBox(height: 2.0)),
              ),
            ),
            if (widget.isToggle == 'true')
              Container(
                child: Switch(
                  value: _model.switchValue!,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.switchValue = newValue);
                  },
                  activeThumbColor: FlutterFlowTheme.of(context).primary,
                  activeTrackColor: FlutterFlowTheme.of(context).accent1,
                  inactiveTrackColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  inactiveThumbColor:
                      FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
            if (widget.hasValue ?? true)
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.value,
                        'Русский',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: FlutterFlowTheme.of(context).hint,
                      size: 20.0,
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}

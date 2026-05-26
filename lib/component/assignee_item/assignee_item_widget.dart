import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assignee_item_model.dart';
export 'assignee_item_model.dart';

class AssigneeItemWidget extends StatefulWidget {
  const AssigneeItemWidget({
    super.key,
    this.initials,
    this.name,
    this.role,
    this.selected,
  });

  final String? initials;
  final String? name;
  final String? role;
  final bool? selected;

  @override
  State<AssigneeItemWidget> createState() => _AssigneeItemWidgetState();
}

class _AssigneeItemWidgetState extends State<AssigneeItemWidget> {
  late AssigneeItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssigneeItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).divider,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  widget.initials!,
                  style: GoogleFonts.inter(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.8,
                  ),
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
                      widget.name!,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.role!,
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
                  ],
                ),
              ),
              Icon(
                Icons.check_box_rounded,
                color: widget.selected!
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).hint,
                size: 20.0,
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
        ),
      ),
    );
  }
}

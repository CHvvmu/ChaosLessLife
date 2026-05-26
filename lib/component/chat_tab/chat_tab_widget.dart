import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chat_tab_model.dart';
export 'chat_tab_model.dart';

class ChatTabWidget extends StatefulWidget {
  const ChatTabWidget({
    super.key,
    this.selected,
    this.label,
  });

  final bool? selected;
  final String? label;

  @override
  State<ChatTabWidget> createState() => _ChatTabWidgetState();
}

class _ChatTabWidgetState extends State<ChatTabWidget> {
  late ChatTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatTabModel());

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
        color: widget.selected! ? Color(0x1522D3EE) : Colors.transparent,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: widget.selected! ? Color(0xFF22D3EE) : Colors.transparent,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Text(
          valueOrDefault<String>(
            widget.label,
            'Все (12)',
          ),
          style: TextStyle(
            color: widget.selected!
                ? Color(0xFF22D3EE)
                : FlutterFlowTheme.of(context).secondaryText,
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }
}

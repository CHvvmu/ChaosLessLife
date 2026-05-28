import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'social_auth_page_model.dart';
export 'social_auth_page_model.dart';

class SocialAuthPageWidget extends StatefulWidget {
  const SocialAuthPageWidget({super.key});

  static String routeName = 'SocialAuthPage';
  static String routePath = '/socialAuthPage';

  @override
  State<SocialAuthPageWidget> createState() => _SocialAuthPageWidgetState();
}

class _SocialAuthPageWidgetState extends State<SocialAuthPageWidget> {
  late SocialAuthPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialAuthPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}

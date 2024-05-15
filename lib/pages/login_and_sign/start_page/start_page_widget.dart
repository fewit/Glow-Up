import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'start_page_model.dart';
export 'start_page_model.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({super.key});

  @override
  State<StartPageWidget> createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
  late StartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      if (currentUserUid != '') {
        context.pushNamed('HomePage');
      } else {
        context.pushNamed('Login');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).startPagePink,
        body: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0,
                valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.2,
                  0.0,
                ),
                0.0,
                0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).logoColor,
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).logoColor,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/GrowUp_dawn_Logo.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.none,
                        alignment: const Alignment(0.0, 0.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  'SayOh',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).logoColor,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

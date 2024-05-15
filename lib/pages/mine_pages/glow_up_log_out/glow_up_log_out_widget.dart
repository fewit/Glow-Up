import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'glow_up_log_out_model.dart';
export 'glow_up_log_out_model.dart';

class GlowUpLogOutWidget extends StatefulWidget {
  const GlowUpLogOutWidget({super.key});

  @override
  State<GlowUpLogOutWidget> createState() => _GlowUpLogOutWidgetState();
}

class _GlowUpLogOutWidgetState extends State<GlowUpLogOutWidget> {
  late GlowUpLogOutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowUpLogOutModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -0.2),
      child: Container(
        width: 311.0,
        height: 234.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 34.0, 24.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: Text(
                      'Log Out',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'SourceHanSans',
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Text(
                    'Are you sure you want to Log Out?\n',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SourceHanSans',
                          color: FlutterFlowTheme.of(context).growUpB60,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w100,
                          useGoogleFonts: false,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          width: 128.0,
                          height: 44.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0x34F22853),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).logoColor,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await currentUserReference!
                              .update(createGlowUpUserRecordData(
                            glowUpIsOnline: false,
                          ));
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('StartPage', context.mounted);
                        },
                        text: 'Yes',
                        options: FFButtonOptions(
                          width: 128.0,
                          height: 44.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).logoColor,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

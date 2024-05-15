import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'glow_up_delete_account_model.dart';
export 'glow_up_delete_account_model.dart';

class GlowUpDeleteAccountWidget extends StatefulWidget {
  const GlowUpDeleteAccountWidget({super.key});

  @override
  State<GlowUpDeleteAccountWidget> createState() =>
      _GlowUpDeleteAccountWidgetState();
}

class _GlowUpDeleteAccountWidgetState extends State<GlowUpDeleteAccountWidget> {
  late GlowUpDeleteAccountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowUpDeleteAccountModel());
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
                      'Delete Account',
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
                    ' Deleting the account will clear the account data. Are you sure to delete?',
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
                          await authManager.deleteUser(context);

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

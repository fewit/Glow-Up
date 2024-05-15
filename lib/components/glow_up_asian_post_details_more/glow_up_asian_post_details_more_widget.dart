import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'glow_up_asian_post_details_more_model.dart';
export 'glow_up_asian_post_details_more_model.dart';

class GlowUpAsianPostDetailsMoreWidget extends StatefulWidget {
  const GlowUpAsianPostDetailsMoreWidget({
    super.key,
    this.glowUpChoosedPost,
    this.glowUpChoosedComment,
  });

  final GlowUpPostRecord? glowUpChoosedPost;
  final GlowUpPostCommentRecord? glowUpChoosedComment;

  @override
  State<GlowUpAsianPostDetailsMoreWidget> createState() =>
      _GlowUpAsianPostDetailsMoreWidgetState();
}

class _GlowUpAsianPostDetailsMoreWidgetState
    extends State<GlowUpAsianPostDetailsMoreWidget> {
  late GlowUpAsianPostDetailsMoreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowUpAsianPostDetailsMoreModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 263.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 41.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Opacity(
              opacity: 0.1,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                child: Container(
                  width: 46.0,
                  height: 7.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF58665D),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed(
                  'Report',
                  queryParameters: {
                    'glowUpReportPost': serializeParam(
                      widget.glowUpChoosedPost,
                      ParamType.Document,
                    ),
                    'glowUpReportCommon': serializeParam(
                      widget.glowUpChoosedComment,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'glowUpReportPost': widget.glowUpChoosedPost,
                    'glowUpReportCommon': widget.glowUpChoosedComment,
                  },
                );

                setState(() {
                  FFAppState().GlowUpPauseVideo = true;
                });
              },
              text: 'Report',
              options: FFButtonOptions(
                width: double.infinity,
                height: 46.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (widget.glowUpChoosedPost != null) {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'Glow_Up_BlockList': FieldValue.arrayUnion(
                              [widget.glowUpChoosedPost?.glowUpCreateUser]),
                          'Glow_Up_FollowList': FieldValue.arrayRemove(
                              [widget.glowUpChoosedPost?.glowUpCreateUser]),
                        },
                      ),
                    });
                  } else {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'Glow_Up_BlockList': FieldValue.arrayUnion(
                              [widget.glowUpChoosedComment?.glowUpCreateUser]),
                          'Glow_Up_FollowList': FieldValue.arrayRemove(
                              [widget.glowUpChoosedComment?.glowUpCreateUser]),
                        },
                      ),
                    });
                  }

                  context.safePop();
                },
                text: 'Block',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 46.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pop();
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 46.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).logoColor,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

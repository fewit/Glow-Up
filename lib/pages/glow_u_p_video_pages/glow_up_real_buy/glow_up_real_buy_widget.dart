import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/glow_u_p_video_pages/glow_up_find_coins_less/glow_up_find_coins_less_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'glow_up_real_buy_model.dart';
export 'glow_up_real_buy_model.dart';

class GlowUpRealBuyWidget extends StatefulWidget {
  const GlowUpRealBuyWidget({
    super.key,
    required this.glowUpChoosedGift,
    required this.glowUpChoosedPost,
    required this.glowUpGiftNum,
  });

  final int? glowUpChoosedGift;
  final GlowUpPostRecord? glowUpChoosedPost;
  final int? glowUpGiftNum;

  @override
  State<GlowUpRealBuyWidget> createState() => _GlowUpRealBuyWidgetState();
}

class _GlowUpRealBuyWidgetState extends State<GlowUpRealBuyWidget> {
  late GlowUpRealBuyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowUpRealBuyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.glowUpGiftPrice = functions.glowUpGiftMultiply(
            widget.glowUpGiftNum!,
            FFAppState()
                .GlowUpGiftList[widget.glowUpChoosedGift!]
                .glowUpGiftPrice);
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 500.0,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Transform.rotate(
            angle: 7.3 * (math.pi / 180),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: 311.0,
                  height: 270.0,
                  decoration: BoxDecoration(
                    color: const Color(0x7FFFFFFF),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x34090F13),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/GrowUp_add_lightImage.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.4, -0.8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/GrowUp_item_smallLight.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Container(
                  width: 311.0,
                  height: 270.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x34090F13),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'This will cost',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SourceHanSans',
                              color: FlutterFlowTheme.of(context).growUpB60,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w100,
                              useGoogleFonts: false,
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 37.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: valueOrDefault<String>(
                                  _model.glowUpGiftPrice?.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SourceHanSans',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              const TextSpan(
                                text: ' gold coins',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SourceHanSans',
                                  color: FlutterFlowTheme.of(context)
                                      .growUpTitleColorBlack,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (valueOrDefault(
                                      currentUserDocument?.glowUpWallet, 0) >=
                                  _model.glowUpGiftPrice!) {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'Glow_Up_Wallet': FieldValue.increment(
                                          -(_model.glowUpGiftPrice!)),
                                    },
                                  ),
                                });

                                await widget.glowUpChoosedPost!.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'Glow_Up_Hot': FieldValue.increment(
                                          functions.glowUpGiftMultiply(
                                              widget.glowUpGiftNum!,
                                              FFAppState()
                                                  .GlowUpGiftList[
                                                      widget.glowUpChoosedGift!]
                                                  .glowUpGiftAddHot)!),
                                    },
                                  ),
                                });
                                Navigator.pop(context);
                                setState(() {
                                  FFAppState().GlowUpSendSuccess =
                                      widget.glowUpChoosedGift!;
                                });
                              } else {
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: const GlowUpFindCoinsLessWidget(),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              }
                            },
                            text: 'Confirm',
                            options: FFButtonOptions(
                              width: 172.0,
                              height: 49.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).logoColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'SourceHanSans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, -0.7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/GrowUp_get_coinImage.png',
                width: 142.0,
                height: 130.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.8),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 32.0,
              fillColor: const Color(0x66FFFFFF),
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 16.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

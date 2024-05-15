import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'recommend_page_model.dart';
export 'recommend_page_model.dart';

class RecommendPageWidget extends StatefulWidget {
  const RecommendPageWidget({super.key});

  @override
  State<RecommendPageWidget> createState() => _RecommendPageWidgetState();
}

class _RecommendPageWidgetState extends State<RecommendPageWidget> {
  late RecommendPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).growUpBgcolor2,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 62.0,
            icon: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: FlutterFlowTheme.of(context).growUpTitleColorBlack,
              size: 32.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Recommend',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'MiSans',
                  color: FlutterFlowTheme.of(context).growUpTitleColorBlack,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              final glowUpRecommendList =
                  FFAppState().GlowUpRecommendList.toList();
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                scrollDirection: Axis.vertical,
                itemCount: glowUpRecommendList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                itemBuilder: (context, glowUpRecommendListIndex) {
                  final glowUpRecommendListItem =
                      glowUpRecommendList[glowUpRecommendListIndex];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'RecommendedDetails',
                          queryParameters: {
                            'glowUpChoosedRecomment': serializeParam(
                              glowUpRecommendListItem,
                              ParamType.DataStruct,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).growUpHomeBgcolor,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 189.0,
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    glowUpRecommendListItem
                                        .glowUpRecommentImage,
                                    fit: BoxFit.fitHeight,
                                    alignment: const Alignment(0.0, -1.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: ClipRRect(
                                  child: Container(
                                    width: double.infinity,
                                    height: 82.0,
                                    decoration: const BoxDecoration(),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 1.01),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 1.0,
                                            sigmaY: 4.0,
                                          ),
                                          child: Stack(
                                            children: [
                                              Opacity(
                                                opacity: 0.8,
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: ClipRRect(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 82.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .logoColor,
                                                            const Color(0x0BFFFFFF)
                                                          ],
                                                          stops: const [0.0, 1.0],
                                                          begin:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          end:
                                                              const AlignmentDirectional(
                                                                  1.0, 0),
                                                        ),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(22.0, 16.0,
                                                          16.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      if (true)
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              glowUpRecommendListItem
                                                                  .glowUpRecommendName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SourceHanSans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            Text(
                                                              glowUpRecommendListItem
                                                                  .glowUpRecommendContent
                                                                  .maybeHandleOverflow(
                                                                maxChars: 5,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SourceHanSans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      Builder(
                                                        builder: (context) {
                                                          if ((currentUserDocument
                                                                      ?.glowUpFavoRecommend
                                                                      .toList() ??
                                                                  [])
                                                              .contains(
                                                                  glowUpRecommendListItem
                                                                      .glowUpRecommendName)) {
                                                            return FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              buttonSize: 40.0,
                                                              fillColor: const Color(
                                                                  0x32000000),
                                                              icon: Icon(
                                                                Icons
                                                                    .favorite_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Glow_Up_FavoRecommend':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        glowUpRecommendListItem
                                                                            .glowUpRecommendName
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                setState(() {});
                                                              },
                                                            );
                                                          } else {
                                                            return FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              buttonSize: 40.0,
                                                              fillColor: const Color(
                                                                  0x32000000),
                                                              icon: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await currentUserReference!
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Glow_Up_FavoRecommend':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        glowUpRecommendListItem
                                                                            .glowUpRecommendName
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                setState(() {});
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

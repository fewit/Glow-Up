import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/glow_up_asian_post_details_more/glow_up_asian_post_details_more_widget.dart';
import '/components/glow_up_dash_own_comment/glow_up_dash_own_comment_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/glow_u_p_video_pages/glow_up_less_send_gifts/glow_up_less_send_gifts_widget.dart';
import '/pages/glow_u_p_video_pages/glow_up_offer_comments/glow_up_offer_comments_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'video_page_model.dart';
export 'video_page_model.dart';

class VideoPageWidget extends StatefulWidget {
  const VideoPageWidget({
    super.key,
    this.glowUpDesignatedList,
  });

  final List<DocumentReference>? glowUpDesignatedList;

  @override
  State<VideoPageWidget> createState() => _VideoPageWidgetState();
}

class _VideoPageWidgetState extends State<VideoPageWidget> {
  late VideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().GlowUpNavPage = 'Video';
      });
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
                    child: PagedPageView<DocumentSnapshot<Object?>?,
                        GlowUpPostRecord>(
                      pagingController: _model.setPageViewController(
                        GlowUpPostRecord.collection
                            .where(
                              'Glow_Up_IsVideo',
                              isEqualTo: true,
                            )
                            .whereNotIn(
                                'Glow_Up_CreateUser',
                                (currentUserDocument?.glowUpBlockList
                                        .toList() ??
                                    [])),
                      ),
                      pageController: _model.pageViewController ??=
                          PageController(
                              initialPage: max(
                                  0, min(0, _model.pageViewLoadedLength - 1))),
                      onPageChanged: (_) => setState(() {
                        _model.pageViewLoadedLength =
                            _model.pageViewPagingController!.itemList!.length;
                      }),
                      scrollDirection: Axis.vertical,
                      builderDelegate:
                          PagedChildBuilderDelegate<GlowUpPostRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).logoColor,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).logoColor,
                              ),
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, pageViewIndex) {
                          final pageViewGlowUpPostRecord = _model
                              .pageViewPagingController!
                              .itemList![pageViewIndex];
                          return Visibility(
                            visible: !(currentUserDocument?.glowUpBlockList
                                        .toList() ??
                                    [])
                                .contains(
                                    pageViewGlowUpPostRecord.glowUpCreateUser),
                            child: StreamBuilder<GlowUpUserRecord>(
                              stream: GlowUpUserRecord.getDocument(
                                  pageViewGlowUpPostRecord.glowUpCreateUser!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .logoColor,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final stackGlowUpUserRecord = snapshot.data!;
                                return SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: custom_widgets
                                            .GlowUpVideoItemWidget(
                                          width: double.infinity,
                                          height: double.infinity,
                                          glowUpVideoUrl:
                                              pageViewGlowUpPostRecord
                                                  .glowUpVideoPath,
                                          glowUpLoadingColor:
                                              FlutterFlowTheme.of(context)
                                                  .logoColor,
                                          glowUpPauseBgColor: const Color(0x80000000),
                                          glowUpPauseVideo:
                                              FFAppState().GlowUpPauseVideo,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 97.0, 106.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (pageViewGlowUpPostRecord
                                                          .glowUpCreateUser !=
                                                      currentUserReference) {
                                                    context.pushNamed(
                                                      'Glow_Up_UserPage',
                                                      queryParameters: {
                                                        'glowUpOwnerUser':
                                                            serializeParam(
                                                          stackGlowUpUserRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'glowUpOwnerUser':
                                                            stackGlowUpUserRecord,
                                                      },
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      'Mine',
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '@',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SourceHanSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
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
                                                      TextSpan(
                                                        text:
                                                            stackGlowUpUserRecord
                                                                .displayName,
                                                        style: const TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SourceHanSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Text(
                                                  pageViewGlowUpPostRecord
                                                      .glowUpContent,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SourceHanSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 102.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 30.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (pageViewGlowUpPostRecord
                                                            .glowUpCreateUser !=
                                                        currentUserReference) {
                                                      context.pushNamed(
                                                        'Glow_Up_UserPage',
                                                        queryParameters: {
                                                          'glowUpOwnerUser':
                                                              serializeParam(
                                                            stackGlowUpUserRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'glowUpOwnerUser':
                                                              stackGlowUpUserRecord,
                                                        },
                                                      );

                                                      setState(() {
                                                        FFAppState()
                                                                .GlowUpPauseVideo =
                                                            true;
                                                      });
                                                    } else {
                                                      context.goNamed(
                                                        'Mine',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 52.0,
                                                    height: 52.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0x4CF22853),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 44.0,
                                                      height: 44.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        stackGlowUpUserRecord
                                                            .photoUrl,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 24.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (!(currentUserDocument
                                                                ?.glowUpFavoPosts
                                                                .toList() ??
                                                            [])
                                                        .contains(
                                                            pageViewGlowUpPostRecord
                                                                .reference)) {
                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'Glow_Up_FavoPosts':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              pageViewGlowUpPostRecord
                                                                  .reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'Glow_Up_FavoPosts':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              pageViewGlowUpPostRecord
                                                                  .reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.favorite_sharp,
                                                        color: (currentUserDocument
                                                                        ?.glowUpFavoPosts
                                                                        .toList() ??
                                                                    [])
                                                                .contains(
                                                                    pageViewGlowUpPostRecord
                                                                        .reference)
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .logoColor
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                        size: 28.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FutureBuilder<int>(
                                                          future:
                                                              queryGlowUpUserRecordCount(
                                                            queryBuilder:
                                                                (glowUpUserRecord) =>
                                                                    glowUpUserRecord
                                                                        .where(
                                                              'Glow_Up_FavoPosts',
                                                              arrayContains:
                                                                  pageViewGlowUpPostRecord
                                                                      .reference,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .logoColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            int textCount =
                                                                snapshot.data!;
                                                            return Text(
                                                              textCount
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 24.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      isDismissible: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                GlowUpOfferCommentsWidget(
                                                              glowUpVideoComments:
                                                                  pageViewGlowUpPostRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/GrowUp_art_commonImage1.png',
                                                          width: 28.0,
                                                          height: 28.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FutureBuilder<int>(
                                                          future:
                                                              queryGlowUpPostCommentRecordCount(
                                                            queryBuilder:
                                                                (glowUpPostCommentRecord) =>
                                                                    glowUpPostCommentRecord
                                                                        .where(
                                                              'Glow_Up_Post',
                                                              isEqualTo:
                                                                  pageViewGlowUpPostRecord
                                                                      .reference,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .logoColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            int textCount =
                                                                snapshot.data!;
                                                            return Text(
                                                              formatNumber(
                                                                textCount,
                                                                formatType:
                                                                    FormatType
                                                                        .compact,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              GlowUpLessSendGiftsWidget(
                                                            glowUpPostToSengGifts:
                                                                pageViewGlowUpPostRecord,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width: 52.0,
                                                  height: 52.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x4CF22853),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/GrowUp_kid_giftImage1.png',
                                                        fit: BoxFit.none,
                                                        alignment:
                                                            const Alignment(0.0, 1.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 257.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/GrowUp_kill_navGradient.png',
                                            ).image,
                                          ),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 52.0, 26.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (pageViewGlowUpPostRecord
                                                      .glowUpCreateUser ==
                                                  currentUserReference) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      const Color(0x99000000),
                                                  isDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            const GlowUpDashOwnCommentWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      const Color(0x99000000),
                                                  isDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            GlowUpAsianPostDetailsMoreWidget(
                                                          glowUpChoosedPost:
                                                              pageViewGlowUpPostRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }
                                            },
                                            child: ClipOval(
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0x1A000000),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 1.0,
                                                      sigmaY: 1.0,
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (pageViewGlowUpPostRecord
                                                                .glowUpCreateUser ==
                                                            currentUserReference) {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: const Color(
                                                                0x99000000),
                                                            isDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      const GlowUpDashOwnCommentWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: const Color(
                                                                0x99000000),
                                                            isDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      GlowUpAsianPostDetailsMoreWidget(
                                                                    glowUpChoosedPost:
                                                                        pageViewGlowUpPostRecord,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      },
                                                      child: Icon(
                                                        Icons.keyboard_control,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: SizedBox(
                width: double.infinity,
                height: 97.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/GrowUp_crazy_navbarBg.png',
                          height: 100.0,
                          fit: BoxFit.none,
                          alignment: const Alignment(0.0, 1.0),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              constraints: const BoxConstraints(
                                minWidth: 32.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(32.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().GlowUpNavPage != 'Home') {
                                    context.goNamed(
                                      'HomePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if (FFAppState().GlowUpNavPage ==
                                          'Home') {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/GrowUp_tec_navHome2.png',
                                            fit: BoxFit.none,
                                          ),
                                        );
                                      } else {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/GrowUp_tec_navHome1.png',
                                            fit: BoxFit.none,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().GlowUpNavPage != 'Video') {
                                    context.goNamed(
                                      'VideoPage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if (FFAppState().GlowUpNavPage ==
                                          'Video') {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/GrowUp_tec_navVideo2.png',
                                            fit: BoxFit.none,
                                          ),
                                        );
                                      } else {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/GrowUp_tec_navVideo1.png',
                                            fit: BoxFit.none,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 26.0,
                              buttonSize: 52.0,
                              fillColor: FlutterFlowTheme.of(context).logoColor,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('releasePage');
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().GlowUpNavPage != 'Chat') {
                                    context.goNamed(
                                      'MessagePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if (FFAppState().GlowUpNavPage ==
                                          'Chat') {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/GrowUp_tec_navMessage2.png',
                                            fit: BoxFit.none,
                                          ),
                                        );
                                      } else {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/GrowUp_tec_navMessage1.png',
                                            fit: BoxFit.none,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().GlowUpNavPage != 'Mine') {
                                    context.goNamed(
                                      'Mine',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if (FFAppState().GlowUpNavPage ==
                                          'Mine') {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/GrowUp_tec_navMine2.png',
                                            fit: BoxFit.none,
                                          ),
                                        );
                                      } else {
                                        return ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.asset(
                                            'assets/images/GrowUp_tec_navMine1.png',
                                            fit: BoxFit.none,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 52.0, 26.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'MiSans',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Flow',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'MiSans',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

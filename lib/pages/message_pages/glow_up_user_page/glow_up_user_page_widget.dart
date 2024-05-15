import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'glow_up_user_page_model.dart';
export 'glow_up_user_page_model.dart';

class GlowUpUserPageWidget extends StatefulWidget {
  const GlowUpUserPageWidget({
    super.key,
    required this.glowUpOwnerUser,
  });

  final GlowUpUserRecord? glowUpOwnerUser;

  @override
  State<GlowUpUserPageWidget> createState() => _GlowUpUserPageWidgetState();
}

class _GlowUpUserPageWidgetState extends State<GlowUpUserPageWidget>
    with TickerProviderStateMixin {
  late GlowUpUserPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowUpUserPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().GlowUpChatUserList = [];
      FFAppState().addToGlowUpChatUserList(widget.glowUpOwnerUser!.reference);
      FFAppState().addToGlowUpChatUserList(currentUserReference!);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/GrowUP_stand_LoginBg.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.8,
                constraints: const BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 62.0, 0.0, 8.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.glowUpOwnerUser?.displayName,
                            'Nameless',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'SourceHanSans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          widget.glowUpOwnerUser!.glowUpDiscribe,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'SourceHanSans',
                                color: FlutterFlowTheme.of(context).growUpB60,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w100,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.glowUpOwnerUser?.glowUpFollowList
                                          .length
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'FoIIowed',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .growUpB60,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FutureBuilder<int>(
                                    future: queryGlowUpUserRecordCount(
                                      queryBuilder: (glowUpUserRecord) =>
                                          glowUpUserRecord.where(
                                        'Glow_Up_FollowList',
                                        arrayContains:
                                            widget.glowUpOwnerUser?.reference,
                                      ),
                                    ),
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
                                      int textCount = snapshot.data!;
                                      return Text(
                                        textCount.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Fans',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .growUpB60,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.glowUpOwnerUser?.glowUpWallet
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Wallet',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .growUpB60,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: const Alignment(-1.0, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context).growUpB60,
                                  labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'SourceHanSans',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'SourceHanSans',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                  indicatorColor: Colors.transparent,
                                  tabs: const [
                                    Tab(
                                      text: 'Photo',
                                    ),
                                    Tab(
                                      text: 'Video',
                                    ),
                                    Tab(
                                      text: 'Likes',
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [
                                      () async {},
                                      () async {},
                                      () async {}
                                    ][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: const BoxDecoration(),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: StreamBuilder<
                                                  List<GlowUpPostRecord>>(
                                                stream: queryGlowUpPostRecord(
                                                  queryBuilder:
                                                      (glowUpPostRecord) =>
                                                          glowUpPostRecord
                                                              .where(
                                                                'Glow_Up_IsVideo',
                                                                isEqualTo:
                                                                    false,
                                                              )
                                                              .where(
                                                                'Glow_Up_CreateUser',
                                                                isEqualTo: widget
                                                                    .glowUpOwnerUser
                                                                    ?.reference,
                                                              ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
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
                                                  List<GlowUpPostRecord>
                                                      wrapGlowUpPostRecordList =
                                                      snapshot.data!;
                                                  return Wrap(
                                                    spacing: 9.0,
                                                    runSpacing: 10.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        wrapGlowUpPostRecordList
                                                            .length,
                                                        (wrapIndex) {
                                                      final wrapGlowUpPostRecord =
                                                          wrapGlowUpPostRecordList[
                                                              wrapIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'PostDetails',
                                                            queryParameters: {
                                                              'glowUpPostID':
                                                                  serializeParam(
                                                                wrapGlowUpPostRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'glowUpPostID':
                                                                  wrapGlowUpPostRecord,
                                                            },
                                                          );
                                                        },
                                                        child: ClipRRect(
                                                          child: Container(
                                                            width: 163.0,
                                                            height: 280.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowMediaDisplay(
                                                                    path: wrapGlowUpPostRecord
                                                                        .glowUpImageList
                                                                        .first,
                                                                    imageBuilder:
                                                                        (path) =>
                                                                            ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      child: Image
                                                                          .network(
                                                                        path,
                                                                        width:
                                                                            163.0,
                                                                        height:
                                                                            208.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    videoPlayerBuilder:
                                                                        (path) =>
                                                                            FlutterFlowVideoPlayer(
                                                                      path:
                                                                          path,
                                                                      width:
                                                                          163.0,
                                                                      height:
                                                                          208.0,
                                                                      autoPlay:
                                                                          false,
                                                                      looping:
                                                                          false,
                                                                      showControls:
                                                                          true,
                                                                      allowFullScreen:
                                                                          true,
                                                                      allowPlaybackSpeedMenu:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Bear Cub',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'SourceHanSans',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    wrapGlowUpPostRecord
                                                                        .glowUpContent,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'SourceHanSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).growUpBandB80,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w100,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: const BoxDecoration(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: const BoxDecoration(),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: StreamBuilder<
                                                  List<GlowUpPostRecord>>(
                                                stream: queryGlowUpPostRecord(
                                                  queryBuilder:
                                                      (glowUpPostRecord) =>
                                                          glowUpPostRecord
                                                              .where(
                                                                'Glow_Up_IsVideo',
                                                                isEqualTo: true,
                                                              )
                                                              .where(
                                                                'Glow_Up_CreateUser',
                                                                isEqualTo: widget
                                                                    .glowUpOwnerUser
                                                                    ?.reference,
                                                              ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
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
                                                  List<GlowUpPostRecord>
                                                      wrapGlowUpPostRecordList =
                                                      snapshot.data!;
                                                  return Wrap(
                                                    spacing: 9.0,
                                                    runSpacing: 10.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        wrapGlowUpPostRecordList
                                                            .length,
                                                        (wrapIndex) {
                                                      final wrapGlowUpPostRecord =
                                                          wrapGlowUpPostRecordList[
                                                              wrapIndex];
                                                      return ClipRRect(
                                                        child: Container(
                                                          width: 163.0,
                                                          height: 280.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          163.0,
                                                                      height:
                                                                          208.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          FlutterFlowVideoPlayer(
                                                                        path: wrapGlowUpPostRecord
                                                                            .glowUpVideoPath,
                                                                        videoType:
                                                                            VideoType.network,
                                                                        autoPlay:
                                                                            false,
                                                                        looping:
                                                                            false,
                                                                        showControls:
                                                                            false,
                                                                        allowFullScreen:
                                                                            true,
                                                                        allowPlaybackSpeedMenu:
                                                                            false,
                                                                        lazyLoad:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        163.0,
                                                                    height:
                                                                        208.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0x801A1A1A),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          ClipOval(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0x1AFFFFFF),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              BackdropFilter(
                                                                            filter:
                                                                                ImageFilter.blur(
                                                                              sigmaX: 20.0,
                                                                              sigmaY: 20.0,
                                                                            ),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.play,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 30.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Bear Cub',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SourceHanSans',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  wrapGlowUpPostRecord
                                                                      .glowUpContent,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SourceHanSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .growUpBandB80,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w100,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: const BoxDecoration(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: const BoxDecoration(),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final glowUpFavoPosts = widget
                                                          .glowUpOwnerUser
                                                          ?.glowUpFavoPosts
                                                          .toList() ??
                                                      [];
                                                  return Wrap(
                                                    spacing: 9.0,
                                                    runSpacing: 10.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        glowUpFavoPosts.length,
                                                        (glowUpFavoPostsIndex) {
                                                      final glowUpFavoPostsItem =
                                                          glowUpFavoPosts[
                                                              glowUpFavoPostsIndex];
                                                      return StreamBuilder<
                                                          GlowUpPostRecord>(
                                                        stream: GlowUpPostRecord
                                                            .getDocument(
                                                                glowUpFavoPostsItem),
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
                                                          final containerGlowUpPostRecord =
                                                              snapshot.data!;
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (!containerGlowUpPostRecord
                                                                  .glowUpIsVideo) {
                                                                context
                                                                    .pushNamed(
                                                                  'PostDetails',
                                                                  queryParameters:
                                                                      {
                                                                    'glowUpPostID':
                                                                        serializeParam(
                                                                      containerGlowUpPostRecord,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'glowUpPostID':
                                                                        containerGlowUpPostRecord,
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            child: ClipRRect(
                                                              child: Container(
                                                                width: 163.0,
                                                                height: 280.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (containerGlowUpPostRecord
                                                                            .glowUpIsVideo) {
                                                                          return Stack(
                                                                            children: [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                child: Container(
                                                                                  width: 163.0,
                                                                                  height: 208.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: FlutterFlowVideoPlayer(
                                                                                    path: containerGlowUpPostRecord.glowUpVideoPath,
                                                                                    videoType: VideoType.network,
                                                                                    autoPlay: false,
                                                                                    looping: false,
                                                                                    showControls: false,
                                                                                    allowFullScreen: true,
                                                                                    allowPlaybackSpeedMenu: false,
                                                                                    lazyLoad: false,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 163.0,
                                                                                height: 208.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: const Color(0x801A1A1A),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: ClipOval(
                                                                                    child: Container(
                                                                                      width: 60.0,
                                                                                      height: 60.0,
                                                                                      decoration: const BoxDecoration(
                                                                                        color: Color(0x1AFFFFFF),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                      child: BackdropFilter(
                                                                                        filter: ImageFilter.blur(
                                                                                          sigmaX: 20.0,
                                                                                          sigmaY: 20.0,
                                                                                        ),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.play,
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          size: 30.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        } else {
                                                                          return Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                FlutterFlowMediaDisplay(
                                                                              path: containerGlowUpPostRecord.glowUpImageList.first,
                                                                              imageBuilder: (path) => ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                child: Image.network(
                                                                                  path,
                                                                                  width: 163.0,
                                                                                  height: 208.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                                                                                path: path,
                                                                                width: 163.0,
                                                                                height: 208.0,
                                                                                autoPlay: false,
                                                                                looping: false,
                                                                                showControls: true,
                                                                                allowFullScreen: true,
                                                                                allowPlaybackSpeedMenu: false,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Bear Cub',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SourceHanSans',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        containerGlowUpPostRecord
                                                                            .glowUpContent,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SourceHanSans',
                                                                              color: FlutterFlowTheme.of(context).growUpBandB80,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w100,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: const BoxDecoration(),
                                            ),
                                          ],
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
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 52.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                      setState(() {
                        FFAppState().GlowUpPauseVideo = false;
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: FlutterFlowTheme.of(context).info,
                      size: 32.0,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        color: Color(0x32000000),
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 4.0,
                            sigmaY: 4.0,
                          ),
                          child: Icon(
                            Icons.keyboard_control,
                            color: FlutterFlowTheme.of(context).info,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.76,
                      0.0,
                    )),
                child: SizedBox(
                  width: 92.0,
                  height: 88.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: 68.0,
                          height: 68.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).info,
                              width: 2.0,
                            ),
                          ),
                          child: Visibility(
                            visible: widget.glowUpOwnerUser?.photoUrl != null &&
                                widget.glowUpOwnerUser?.photoUrl != '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(34.0),
                              child: Image.network(
                                widget.glowUpOwnerUser!.photoUrl,
                                width: 68.0,
                                height: 68.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if ((currentUserDocument?.glowUpFollowList
                                        .toList() ??
                                    [])
                                .contains(widget.glowUpOwnerUser?.reference)) {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'Glow_Up_FollowList':
                                        FieldValue.arrayRemove([
                                      widget.glowUpOwnerUser?.reference
                                    ]),
                                  },
                                ),
                              });
                            } else {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'Glow_Up_FollowList': FieldValue.arrayUnion(
                                        [widget.glowUpOwnerUser?.reference]),
                                  },
                                ),
                              });
                            }

                            setState(() {});
                          },
                          child: Container(
                            width: 92.0,
                            height: 29.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).logoColor,
                              borderRadius: BorderRadius.circular(24.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 12.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (!(currentUserDocument
                                                  ?.glowUpFollowList
                                                  .toList() ??
                                              [])
                                          .contains(widget
                                              .glowUpOwnerUser?.reference)) {
                                        return Icon(
                                          Icons.add_circle,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 16.0,
                                        );
                                      } else {
                                        return Icon(
                                          Icons.remove_circle,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 16.0,
                                        );
                                      }
                                    },
                                  ),
                                  Text(
                                    'Follow',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SourceHanSans',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w100,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
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
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 95.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 1.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        -1.0,
                      ),
                    )
                  ],
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                    child: StreamBuilder<List<GlowUpChatRecord>>(
                      stream: queryGlowUpChatRecord(
                        queryBuilder: (glowUpChatRecord) =>
                            glowUpChatRecord.whereArrayContainsAny(
                                'Glow_Up_ChatUsers',
                                FFAppState().GlowUpChatUserList),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).logoColor,
                                ),
                              ),
                            ),
                          );
                        }
                        List<GlowUpChatRecord> buttonGlowUpChatRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final buttonGlowUpChatRecord =
                            buttonGlowUpChatRecordList.isNotEmpty
                                ? buttonGlowUpChatRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            if (buttonGlowUpChatRecord?.reference != null) {
                              context.pushNamed(
                                'Glow_Up_ChatPage',
                                queryParameters: {
                                  'glowUpChat': serializeParam(
                                    buttonGlowUpChatRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'glowUpChat': buttonGlowUpChatRecord,
                                },
                              );

                              return;
                            } else {
                              await GlowUpChatRecord.collection.doc().set({
                                ...mapToFirestore(
                                  {
                                    'Glow_Up_ChatUsers':
                                        FFAppState().GlowUpChatUserList,
                                  },
                                ),
                              });

                              context.pushNamed('Glow_Up_ChatPage');

                              return;
                            }
                          },
                          text: 'Chat',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 46.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).logoColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/glow_up_asian_post_details_more/glow_up_asian_post_details_more_widget.dart';
import '/components/glow_up_dash_own_comment/glow_up_dash_own_comment_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'post_details_model.dart';
export 'post_details_model.dart';

class PostDetailsWidget extends StatefulWidget {
  const PostDetailsWidget({
    super.key,
    required this.glowUpPostID,
  });

  final GlowUpPostRecord? glowUpPostID;

  @override
  State<PostDetailsWidget> createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget>
    with TickerProviderStateMixin {
  late PostDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailsModel());

    _model.fullNameTextController ??= TextEditingController();
    _model.fullNameFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textFieldOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 4,
            offset: const Offset(2.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GlowUpPostRecord>(
      stream: GlowUpPostRecord.getDocument(widget.glowUpPostID!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
          );
        }
        final postDetailsGlowUpPostRecord = snapshot.data!;
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
                  child: Builder(
                    builder: (context) {
                      final glowUpPostImageList =
                          widget.glowUpPostID?.glowUpImageList.toList() ?? [];
                      return SizedBox(
                        width: double.infinity,
                        height: 500.0,
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: max(
                                          0,
                                          min(0,
                                              glowUpPostImageList.length - 1))),
                              scrollDirection: Axis.horizontal,
                              itemCount: glowUpPostImageList.length,
                              itemBuilder: (context, glowUpPostImageListIndex) {
                                final glowUpPostImageListItem =
                                    glowUpPostImageList[
                                        glowUpPostImageListIndex];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    glowUpPostImageListItem,
                                    width: double.infinity,
                                    height: 500.0,
                                    fit: BoxFit.cover,
                                    alignment: const Alignment(0.0, 0.8),
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 110.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  0,
                                                  glowUpPostImageList.length -
                                                      1))),
                                  count: glowUpPostImageList.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    setState(() {});
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 4.0,
                                    spacing: 4.0,
                                    radius: 16.0,
                                    dotWidth: 6.0,
                                    dotHeight: 6.0,
                                    dotColor: const Color(0x7FFFFFFF),
                                    activeDotColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 367.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(40.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(40.0),
                          ),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2.0,
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 80.0),
                            child: FutureBuilder<int>(
                              future: queryGlowUpPostCommentRecordCount(
                                queryBuilder: (glowUpPostCommentRecord) =>
                                    glowUpPostCommentRecord.where(
                                  'Glow_Up_Post',
                                  isEqualTo: widget.glowUpPostID?.reference,
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
                                int columnCount = snapshot.data!;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      StreamBuilder<GlowUpUserRecord>(
                                        stream: GlowUpUserRecord.getDocument(
                                            postDetailsGlowUpPostRecord
                                                .glowUpCreateUser!),
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
                                                    FlutterFlowTheme.of(context)
                                                        .logoColor,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final rowGlowUpUserRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (postDetailsGlowUpPostRecord
                                                      .glowUpCreateUser !=
                                                  currentUserReference) {
                                                context.pushNamed(
                                                  'Glow_Up_UserPage',
                                                  queryParameters: {
                                                    'glowUpOwnerUser':
                                                        serializeParam(
                                                      rowGlowUpUserRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'glowUpOwnerUser':
                                                        rowGlowUpUserRecord,
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
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    rowGlowUpUserRecord
                                                        .photoUrl,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              rowGlowUpUserRecord
                                                                  .displayName,
                                                              'Nameless',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SourceHanSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .growUpTitleColorBlack,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      2.0),
                                                          child: Text(
                                                            rowGlowUpUserRecord
                                                                .glowUpDiscribe,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SourceHanSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .growUpTitleColorBlack,
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 24.0, 0.0),
                                        child: Text(
                                          postDetailsGlowUpPostRecord
                                              .glowUpContent,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SourceHanSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .growUpB60,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w100,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Comments    ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'MiSans',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: columnCount.toString(),
                                                style: const TextStyle(
                                                  fontFamily: 'SourceHanSans',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: StreamBuilder<
                                            List<GlowUpPostCommentRecord>>(
                                          stream: queryGlowUpPostCommentRecord(
                                            queryBuilder:
                                                (glowUpPostCommentRecord) =>
                                                    glowUpPostCommentRecord
                                                        .where(
                                              'Glow_Up_Post',
                                              isEqualTo: widget
                                                  .glowUpPostID?.reference,
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
                                            List<GlowUpPostCommentRecord>
                                                columnGlowUpPostCommentRecordList =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  columnGlowUpPostCommentRecordList
                                                      .length, (columnIndex) {
                                                final columnGlowUpPostCommentRecord =
                                                    columnGlowUpPostCommentRecordList[
                                                        columnIndex];
                                                return StreamBuilder<
                                                    GlowUpUserRecord>(
                                                  stream: GlowUpUserRecord
                                                      .getDocument(
                                                          columnGlowUpPostCommentRecord
                                                              .glowUpCreateUser!),
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
                                                    final rowGlowUpUserRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: InkWell(
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
                                                              if (columnGlowUpPostCommentRecord
                                                                      .glowUpCreateUser !=
                                                                  currentUserReference) {
                                                                context
                                                                    .pushNamed(
                                                                  'Glow_Up_UserPage',
                                                                  queryParameters:
                                                                      {
                                                                    'glowUpOwnerUser':
                                                                        serializeParam(
                                                                      rowGlowUpUserRecord,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'glowUpOwnerUser':
                                                                        rowGlowUpUserRecord,
                                                                  },
                                                                );
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  'Mine',
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        const TransitionInfo(
                                                                      hasTransition:
                                                                          true,
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
                                                              width: 28.0,
                                                              height: 28.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                rowGlowUpUserRecord
                                                                    .photoUrl,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        24.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        rowGlowUpUserRecord
                                                                            .displayName,
                                                                        'Nameless',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SourceHanSans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).growUpTitleColorBlack,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (postDetailsGlowUpPostRecord.glowUpCreateUser ==
                                                                            currentUserReference) {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            barrierColor:
                                                                                const Color(0x99000000),
                                                                            isDismissible:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: const GlowUpDashOwnCommentWidget(),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        } else {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            barrierColor:
                                                                                const Color(0x99000000),
                                                                            isDismissible:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: GlowUpAsianPostDetailsMoreWidget(
                                                                                    glowUpChoosedComment: columnGlowUpPostCommentRecord,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        }
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_control,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  columnGlowUpPostCommentRecord
                                                                      .glowUpComment,
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
                                                                            .growUpB60,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w100,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }).divide(const SizedBox(height: 16.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.9, -0.9),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: Colors.transparent,
                    icon: FaIcon(
                      FontAwesomeIcons.angleLeft,
                      color: FlutterFlowTheme.of(context).growUpTitleColorBlack,
                      size: 32.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.9, -0.9),
                  child: StreamBuilder<GlowUpUserRecord>(
                    stream: GlowUpUserRecord.getDocument(
                        postDetailsGlowUpPostRecord.glowUpCreateUser!),
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
                      final iconButtonGlowUpUserRecord = snapshot.data!;
                      return FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        fillColor: const Color(0x32000000),
                        icon: Icon(
                          Icons.keyboard_control,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (postDetailsGlowUpPostRecord.glowUpCreateUser ==
                              currentUserReference) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: const Color(0x99000000),
                              isDismissible: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const GlowUpDashOwnCommentWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: const Color(0x99000000),
                              isDismissible: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: GlowUpAsianPostDetailsMoreWidget(
                                      glowUpChoosedPost: widget.glowUpPostID,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 80.0,
                    constraints: const BoxConstraints(
                      minHeight: 80.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 6.0, 16.0, 0.0),
                              child: TextFormField(
                                controller: _model.fullNameTextController,
                                focusNode: _model.fullNameFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Say something',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w100,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFF8F8F8),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 20.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SourceHanSans',
                                      color: FlutterFlowTheme.of(context)
                                          .growUpTitleColorBlack,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: null,
                                validator: _model
                                    .fullNameTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[a-zA-Z]'))
                                ],
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'textFieldOnActionTriggerAnimation']!,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.fullNameTextController.text !=
                                          '') {
                                    await GlowUpPostCommentRecord.collection
                                        .doc()
                                        .set(createGlowUpPostCommentRecordData(
                                          glowUpPost:
                                              widget.glowUpPostID?.reference,
                                          glowUpCreateUser:
                                              currentUserReference,
                                          glowUpComment: _model
                                              .pageViewCurrentIndex
                                              .toString(),
                                        ));
                                    setState(() {
                                      _model.fullNameTextController?.clear();
                                    });
                                  } else {
                                    if (animationsMap[
                                            'textFieldOnActionTriggerAnimation'] !=
                                        null) {
                                      await animationsMap[
                                              'textFieldOnActionTriggerAnimation']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                  }
                                },
                                text: 'Send',
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).logoColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'SourceHanSans',
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                  borderSide: const BorderSide(
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 342.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).logoColor,
                            shape: BoxShape.circle,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'Glow_Up_FavoPosts':
                                          FieldValue.arrayUnion([
                                        postDetailsGlowUpPostRecord.reference
                                      ]),
                                    },
                                  ),
                                });
                              },
                              child: Builder(
                                builder: (context) {
                                  if ((currentUserDocument?.glowUpFavoPosts
                                              .toList() ??
                                          [])
                                      .contains(postDetailsGlowUpPostRecord
                                          .reference)) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'Glow_Up_FavoPosts':
                                                  FieldValue.arrayRemove([
                                                postDetailsGlowUpPostRecord
                                                    .reference
                                              ]),
                                            },
                                          ),
                                        });
                                      },
                                      child: Icon(
                                        Icons.favorite_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 34.0,
                                      ),
                                    );
                                  } else {
                                    return Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 34.0,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: FutureBuilder<int>(
                            future: queryGlowUpUserRecordCount(
                              queryBuilder: (glowUpUserRecord) =>
                                  glowUpUserRecord.where(
                                'Glow_Up_FavoPosts',
                                arrayContains: widget.glowUpPostID?.reference,
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).logoColor,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              int textCount = snapshot.data!;
                              return Text(
                                formatNumber(
                                  textCount,
                                  formatType: FormatType.compact,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'D Din',
                                      color: FlutterFlowTheme.of(context)
                                          .growUpTitleColorBlack,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              );
                            },
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
      },
    );
  }
}

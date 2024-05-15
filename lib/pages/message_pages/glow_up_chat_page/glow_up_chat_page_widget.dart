import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'glow_up_chat_page_model.dart';
export 'glow_up_chat_page_model.dart';

class GlowUpChatPageWidget extends StatefulWidget {
  const GlowUpChatPageWidget({
    super.key,
    this.glowUpChat,
  });

  final GlowUpChatRecord? glowUpChat;

  @override
  State<GlowUpChatPageWidget> createState() => _GlowUpChatPageWidgetState();
}

class _GlowUpChatPageWidgetState extends State<GlowUpChatPageWidget>
    with TickerProviderStateMixin {
  late GlowUpChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowUpChatPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.glowUpChat != null) {
        await currentUserReference!.update(createGlowUpUserRecordData(
          glowUpInChatRoom: widget.glowUpChat?.reference,
        ));
        return;
      } else {
        return;
      }
    });

    _model.glowUpChatTextTextController ??= TextEditingController();
    _model.glowUpChatTextFocusNode ??= FocusNode();

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
    context.watch<FFAppState>();

    return StreamBuilder<List<GlowUpChatRecord>>(
      stream: queryGlowUpChatRecord(
        queryBuilder: (glowUpChatRecord) =>
            glowUpChatRecord.whereArrayContainsAny(
                'Glow_Up_ChatUsers',
                widget.glowUpChat != null
                    ? widget.glowUpChat?.glowUpChatUsers
                    : FFAppState().GlowUpChatUserList),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<GlowUpChatRecord> glowUpChatPageGlowUpChatRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final glowUpChatPageGlowUpChatRecord =
            glowUpChatPageGlowUpChatRecordList.isNotEmpty
                ? glowUpChatPageGlowUpChatRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 32.0,
                ),
                onPressed: () async {
                  context.pop();

                  await currentUserReference!.update({
                    ...mapToFirestore(
                      {
                        'Glow_Up_InChatRoom': FieldValue.delete(),
                      },
                    ),
                  });
                  if (glowUpChatPageGlowUpChatRecord?.glowUpSendUser == null) {
                    await glowUpChatPageGlowUpChatRecord!.reference.delete();
                    return;
                  } else {
                    return;
                  }
                },
              ),
              actions: [
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 62.0,
                  icon: Icon(
                    Icons.keyboard_control,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<GlowUpUserRecord>(
                stream: GlowUpUserRecord.getDocument(widget.glowUpChat != null
                    ? widget.glowUpChat!.glowUpChatUsers
                        .where((e) => e != currentUserReference)
                        .toList()
                        .first
                    : glowUpChatPageGlowUpChatRecord!.glowUpChatUsers
                        .where((e) => e != currentUserReference)
                        .toList()
                        .first),
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
                  final columnGlowUpUserRecord = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  columnGlowUpUserRecord.photoUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    columnGlowUpUserRecord.displayName,
                                    'Nameless',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'MiSans',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child:
                                StreamBuilder<List<GlowUpChatMessagesRecord>>(
                              stream: queryGlowUpChatMessagesRecord(
                                queryBuilder: (glowUpChatMessagesRecord) =>
                                    glowUpChatMessagesRecord
                                        .where(
                                          'Glow_Up_ChatRoom',
                                          isEqualTo: widget.glowUpChat != null
                                              ? widget.glowUpChat?.reference
                                              : glowUpChatPageGlowUpChatRecord
                                                  ?.reference,
                                        )
                                        .orderBy('Glow_Up_SendTime',
                                            descending: true),
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
                                List<GlowUpChatMessagesRecord>
                                    listViewGlowUpChatMessagesRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    20.0,
                                    0,
                                    20.0,
                                  ),
                                  reverse: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewGlowUpChatMessagesRecordList
                                          .length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewGlowUpChatMessagesRecord =
                                        listViewGlowUpChatMessagesRecordList[
                                            listViewIndex];
                                    return Builder(
                                      builder: (context) {
                                        if (listViewGlowUpChatMessagesRecord
                                                .glowUpSendUser ==
                                            currentUserReference) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.3,
                                                      0.0,
                                                    ),
                                                    0.0,
                                                    0.0,
                                                    0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (listViewGlowUpChatMessagesRecord
                                                    .glowUpShowSendTime)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 16.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'jm',
                                                          listViewGlowUpChatMessagesRecord
                                                              .glowUpSendTime!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .growUpBandB80,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (listViewGlowUpChatMessagesRecord
                                                                  .glowUpContent !=
                                                              '') {
                                                        return Stack(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          children: [
                                                            Transform.translate(
                                                              offset: const Offset(
                                                                  -6.0, 0.0),
                                                              child: Transform
                                                                  .scale(
                                                                scaleX: 1.0,
                                                                scaleY: 0.8,
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child: Transform
                                                                      .rotate(
                                                                    angle: 45.0 *
                                                                        (math.pi /
                                                                            180),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .logoColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .logoColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            14.0,
                                                                            20.0,
                                                                            14.0),
                                                                    child: Text(
                                                                      listViewGlowUpChatMessagesRecord
                                                                          .glowUpContent,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      } else if (listViewGlowUpChatMessagesRecord
                                                                  .glowUpImagePath !=
                                                              '') {
                                                        return Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: SizedBox(
                                                            width: 130.0,
                                                            height: 120.0,
                                                            child: Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        129.0,
                                                                    height:
                                                                        120.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child: Transform
                                                                        .scale(
                                                                      scaleX:
                                                                          1.3,
                                                                      scaleY:
                                                                          1.38,
                                                                      origin: const Offset(
                                                                          -3.0,
                                                                          0),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              120.0,
                                                                          height:
                                                                              120.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            listViewGlowUpChatMessagesRecord.glowUpImagePath,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              10.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(20.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              10.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(20.0),
                                                                              topRight: Radius.circular(0.0),
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
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
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
                                                              if (_model
                                                                  .glowUpIsPlayAudio) {
                                                                if (_model
                                                                        .glowUpPlayedMessage ==
                                                                    listViewGlowUpChatMessagesRecord
                                                                        .glowUpAudioPath) {
                                                                  _model
                                                                      .soundPlayer2
                                                                      ?.stop();
                                                                  _model
                                                                      .soundPlayer3
                                                                      ?.stop();
                                                                  _model
                                                                      .soundPlayer1
                                                                      ?.stop();
                                                                  _model
                                                                      .soundPlayer4
                                                                      ?.stop();
                                                                } else {
                                                                  setState(() {
                                                                    _model.glowUpPlayedMessage =
                                                                        listViewGlowUpChatMessagesRecord
                                                                            .glowUpAudioPath;
                                                                  });
                                                                  _model.soundPlayer1 ??=
                                                                      AudioPlayer();
                                                                  if (_model
                                                                      .soundPlayer1!
                                                                      .playing) {
                                                                    await _model
                                                                        .soundPlayer1!
                                                                        .stop();
                                                                  }
                                                                  _model
                                                                      .soundPlayer1!
                                                                      .setVolume(
                                                                          1.0);
                                                                  await _model
                                                                      .soundPlayer1!
                                                                      .setUrl(listViewGlowUpChatMessagesRecord
                                                                          .glowUpAudioPath)
                                                                      .then((_) => _model
                                                                          .soundPlayer1!
                                                                          .play());
                                                                }
                                                              } else {
                                                                setState(() {
                                                                  _model.glowUpPlayedMessage =
                                                                      listViewGlowUpChatMessagesRecord
                                                                          .glowUpAudioPath;
                                                                  _model.glowUpIsPlayAudio =
                                                                      !_model
                                                                          .glowUpIsPlayAudio;
                                                                });
                                                                _model.soundPlayer2 ??=
                                                                    AudioPlayer();
                                                                if (_model
                                                                    .soundPlayer2!
                                                                    .playing) {
                                                                  await _model
                                                                      .soundPlayer2!
                                                                      .stop();
                                                                }
                                                                _model
                                                                    .soundPlayer2!
                                                                    .setVolume(
                                                                        1.0);
                                                                await _model
                                                                    .soundPlayer2!
                                                                    .setUrl(listViewGlowUpChatMessagesRecord
                                                                        .glowUpAudioPath)
                                                                    .then((_) => _model
                                                                        .soundPlayer2!
                                                                        .play());
                                                              }

                                                              setState(() {
                                                                _model.glowUpIsPlayAudio =
                                                                    !_model
                                                                        .glowUpIsPlayAudio;
                                                              });
                                                            },
                                                            child: Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              children: [
                                                                Transform
                                                                    .translate(
                                                                  offset:
                                                                      const Offset(
                                                                          -6.0,
                                                                          0.0),
                                                                  child:
                                                                      Transform
                                                                          .scale(
                                                                    scaleX: 1.0,
                                                                    scaleY: 0.8,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child: Transform
                                                                          .rotate(
                                                                        angle: 45.0 *
                                                                            (math.pi /
                                                                                180),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).logoColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .logoColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: listViewGlowUpChatMessagesRecord.glowUpAudioTime.toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                    const TextSpan(
                                                                                      text: 'S',
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if (!((listViewGlowUpChatMessagesRecord.glowUpAudioPath == _model.glowUpPlayedMessage) && _model.glowUpIsPlayAudio)) {
                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.asset(
                                                                                      'assets/images/Glow_Up_ChatAudioRight.png',
                                                                                      width: 16.0,
                                                                                      height: 22.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Icon(
                                                                                    Icons.pause,
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    size: 22.0,
                                                                                  );
                                                                                }
                                                                              },
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
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.3,
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (listViewGlowUpChatMessagesRecord
                                                    .glowUpShowSendTime)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'jm',
                                                          listViewGlowUpChatMessagesRecord
                                                              .glowUpSendTime!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .growUpBandB80,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                Builder(
                                                  builder: (context) {
                                                    if (listViewGlowUpChatMessagesRecord
                                                                .glowUpContent !=
                                                            '') {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Stack(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          children: [
                                                            Transform.translate(
                                                              offset: const Offset(
                                                                  6.0, 0.0),
                                                              child: Transform
                                                                  .scale(
                                                                scaleX: 1.0,
                                                                scaleY: 0.8,
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Transform
                                                                      .rotate(
                                                                    angle: 45.0 *
                                                                        (math.pi /
                                                                            180),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            14.0,
                                                                            20.0,
                                                                            14.0),
                                                                    child: Text(
                                                                      listViewGlowUpChatMessagesRecord
                                                                          .glowUpContent,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    } else if (listViewGlowUpChatMessagesRecord
                                                                .glowUpImagePath !=
                                                            '') {
                                                      return Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: SizedBox(
                                                            width: 130.0,
                                                            height: 120.0,
                                                            child: Stack(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        120.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child: Transform
                                                                        .scale(
                                                                      scaleX:
                                                                          1.3,
                                                                      scaleY:
                                                                          1.38,
                                                                      origin:
                                                                          const Offset(
                                                                              5.0,
                                                                              0),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              120.0,
                                                                          height:
                                                                              120.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            listViewGlowUpChatMessagesRecord.glowUpImagePath,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(20.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            10.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(20.0),
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
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (_model
                                                                .glowUpIsPlayAudio) {
                                                              if (_model
                                                                      .glowUpPlayedMessage ==
                                                                  listViewGlowUpChatMessagesRecord
                                                                      .glowUpAudioPath) {
                                                                _model
                                                                    .soundPlayer2
                                                                    ?.stop();
                                                                _model
                                                                    .soundPlayer3
                                                                    ?.stop();
                                                                _model
                                                                    .soundPlayer1
                                                                    ?.stop();
                                                                _model
                                                                    .soundPlayer4
                                                                    ?.stop();
                                                              } else {
                                                                setState(() {
                                                                  _model.glowUpPlayedMessage =
                                                                      listViewGlowUpChatMessagesRecord
                                                                          .glowUpAudioPath;
                                                                });
                                                                _model.soundPlayer3 ??=
                                                                    AudioPlayer();
                                                                if (_model
                                                                    .soundPlayer3!
                                                                    .playing) {
                                                                  await _model
                                                                      .soundPlayer3!
                                                                      .stop();
                                                                }
                                                                _model
                                                                    .soundPlayer3!
                                                                    .setVolume(
                                                                        1.0);
                                                                await _model
                                                                    .soundPlayer3!
                                                                    .setUrl(listViewGlowUpChatMessagesRecord
                                                                        .glowUpAudioPath)
                                                                    .then((_) => _model
                                                                        .soundPlayer3!
                                                                        .play());
                                                              }
                                                            } else {
                                                              setState(() {
                                                                _model.glowUpPlayedMessage =
                                                                    listViewGlowUpChatMessagesRecord
                                                                        .glowUpAudioPath;
                                                                _model.glowUpIsPlayAudio =
                                                                    !_model
                                                                        .glowUpIsPlayAudio;
                                                              });
                                                              _model.soundPlayer4 ??=
                                                                  AudioPlayer();
                                                              if (_model
                                                                  .soundPlayer4!
                                                                  .playing) {
                                                                await _model
                                                                    .soundPlayer4!
                                                                    .stop();
                                                              }
                                                              _model
                                                                  .soundPlayer4!
                                                                  .setVolume(
                                                                      1.0);
                                                              await _model
                                                                  .soundPlayer4!
                                                                  .setUrl(listViewGlowUpChatMessagesRecord
                                                                      .glowUpAudioPath)
                                                                  .then((_) => _model
                                                                      .soundPlayer4!
                                                                      .play());
                                                            }

                                                            setState(() {
                                                              _model.glowUpIsPlayAudio =
                                                                  !_model
                                                                      .glowUpIsPlayAudio;
                                                            });
                                                          },
                                                          child: Stack(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            children: [
                                                              Transform
                                                                  .translate(
                                                                offset: const Offset(
                                                                    6.0, 0.0),
                                                                child: Transform
                                                                    .scale(
                                                                  scaleX: 1.0,
                                                                  scaleY: 0.8,
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Transform
                                                                        .rotate(
                                                                      angle: 45.0 *
                                                                          (math.pi /
                                                                              180),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            20.0,
                                                                        height:
                                                                            20.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(2.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (!((listViewGlowUpChatMessagesRecord.glowUpAudioPath == _model.glowUpPlayedMessage) && _model.glowUpIsPlayAudio)) {
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.asset(
                                                                                    'assets/images/Glow_Up_ChatAudioPlay.png',
                                                                                    width: 16.0,
                                                                                    height: 22.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                return Icon(
                                                                                  Icons.pause,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 22.0,
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                20.0,
                                                                                0.0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: listViewGlowUpChatMessagesRecord.glowUpAudioTime.toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  const TextSpan(
                                                                                    text: 'S',
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Roboto',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
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
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          minHeight: 68.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 12.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _model
                                              .glowUpChatTextTextController,
                                          focusNode:
                                              _model.glowUpChatTextFocusNode,
                                          onFieldSubmitted: (_) async {
                                            if (_model.glowUpChatTextTextController
                                                        .text !=
                                                    '') {
                                              await GlowUpChatMessagesRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createGlowUpChatMessagesRecordData(
                                                  glowUpSendUser:
                                                      currentUserReference,
                                                  glowUpContent: _model
                                                      .glowUpChatTextTextController
                                                      .text,
                                                  glowUpChatRoom: widget
                                                              .glowUpChat !=
                                                          null
                                                      ? widget
                                                          .glowUpChat?.reference
                                                      : glowUpChatPageGlowUpChatRecord
                                                          ?.reference,
                                                  glowUpShowSendTime: (glowUpChatPageGlowUpChatRecord
                                                                  ?.glowUpSendTime !=
                                                              null
                                                          ? functions.glowUpTimeDifference(
                                                              glowUpChatPageGlowUpChatRecord!
                                                                  .glowUpSendTime!,
                                                              getCurrentTimestamp)
                                                          : 300) >=
                                                      300,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'Glow_Up_SendTime':
                                                        FieldValue
                                                            .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              if (widget.glowUpChat != null) {
                                                await widget
                                                    .glowUpChat!.reference
                                                    .update({
                                                  ...createGlowUpChatRecordData(
                                                    glowUpLastMessage: _model
                                                        .glowUpChatTextTextController
                                                        .text,
                                                    glowUpSendUser:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'Glow_Up_UnreadMessage':
                                                          FieldValue.increment(
                                                              columnGlowUpUserRecord
                                                                          .glowUpInChatRoom ==
                                                                      widget
                                                                          .glowUpChat
                                                                          ?.reference
                                                                  ? 0
                                                                  : 1),
                                                      'Glow_Up_SendTime':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                await glowUpChatPageGlowUpChatRecord!
                                                    .reference
                                                    .update({
                                                  ...createGlowUpChatRecordData(
                                                    glowUpLastMessage: _model
                                                        .glowUpChatTextTextController
                                                        .text,
                                                    glowUpSendUser:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'Glow_Up_UnreadMessage':
                                                          FieldValue.increment(
                                                              columnGlowUpUserRecord
                                                                          .glowUpInChatRoom ==
                                                                      glowUpChatPageGlowUpChatRecord
                                                                          .reference
                                                                  ? 0
                                                                  : 1),
                                                      'Glow_Up_SendTime':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                              }

                                              setState(() {
                                                _model
                                                    .glowUpChatTextTextController
                                                    ?.clear();
                                              });
                                              if (currentUserDocument
                                                      ?.glowUpInChatRoom ==
                                                  null) {
                                                await currentUserReference!.update(
                                                    createGlowUpUserRecordData(
                                                  glowUpInChatRoom:
                                                      glowUpChatPageGlowUpChatRecord
                                                          ?.reference,
                                                ));
                                                return;
                                              } else {
                                                return;
                                              }
                                            } else {
                                              if (animationsMap[
                                                      'textFieldOnActionTriggerAnimation'] !=
                                                  null) {
                                                await animationsMap[
                                                        'textFieldOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              return;
                                            }
                                          },
                                          textInputAction: TextInputAction.send,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Say something',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            filled: true,
                                            fillColor: const Color(0xFFF8F8F8),
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 60.0, 12.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SourceHanSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .growUpTitleColorBlack,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                          textAlign: TextAlign.start,
                                          maxLines: null,
                                          minLines: 1,
                                          validator: _model
                                              .glowUpChatTextTextControllerValidator
                                              .asValidator(context),
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'textFieldOnActionTriggerAnimation']!,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .logoColor,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 14.0,
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              _model.glowUpChatOpenTools =
                                                  !_model.glowUpChatOpenTools;
                                              _model.glowUpOpenAudioMic = false;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 66.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        child: Image.asset(
                                          'assets/images/Glow_Up_ChatEmoji.png',
                                          width: 32.0,
                                          height: 32.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (_model.glowUpChatOpenTools)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 24.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await requestPermission(
                                                    microphonePermission);
                                                if (await getPermissionStatus(
                                                    microphonePermission)) {
                                                  setState(() {
                                                    _model.glowUpOpenAudioMic =
                                                        !_model
                                                            .glowUpOpenAudioMic;
                                                  });
                                                  return;
                                                } else {
                                                  return;
                                                }
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/Glow_Up_ChatMic.png',
                                                  width: 32.0,
                                                  height: 32.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 24.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.glowUpOpenAudioMic =
                                                      false;
                                                });
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  allowPhoto: true,
                                                  textColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .logoColor,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading1 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading1 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile1 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl1 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                if ((_model.uploadedFileUrl1 !=
                                                        _model
                                                            .glowUpUploadedFilePath) &&
                                                    (_model.uploadedFileUrl1 !=
                                                            '')) {
                                                  await GlowUpChatMessagesRecord
                                                      .collection
                                                      .doc()
                                                      .set({
                                                    ...createGlowUpChatMessagesRecordData(
                                                      glowUpSendUser:
                                                          currentUserReference,
                                                      glowUpChatRoom: widget
                                                                  .glowUpChat !=
                                                              null
                                                          ? widget.glowUpChat
                                                              ?.reference
                                                          : glowUpChatPageGlowUpChatRecord
                                                              ?.reference,
                                                      glowUpShowSendTime: (glowUpChatPageGlowUpChatRecord
                                                                      ?.glowUpSendTime !=
                                                                  null
                                                              ? functions.glowUpTimeDifference(
                                                                  glowUpChatPageGlowUpChatRecord!
                                                                      .glowUpSendTime!,
                                                                  getCurrentTimestamp)
                                                              : 300) >=
                                                          300,
                                                      glowUpImagePath: _model
                                                          .uploadedFileUrl1,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'Glow_Up_SendTime':
                                                            FieldValue
                                                                .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  if (widget.glowUpChat !=
                                                      null) {
                                                    await widget
                                                        .glowUpChat!.reference
                                                        .update({
                                                      ...createGlowUpChatRecordData(
                                                        glowUpLastMessage:
                                                            '[Image]',
                                                        glowUpSendUser:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'Glow_Up_UnreadMessage':
                                                              FieldValue.increment(
                                                                  columnGlowUpUserRecord
                                                                              .glowUpInChatRoom ==
                                                                          widget
                                                                              .glowUpChat
                                                                              ?.reference
                                                                      ? 0
                                                                      : 1),
                                                          'Glow_Up_SendTime':
                                                              FieldValue
                                                                  .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                  } else {
                                                    await glowUpChatPageGlowUpChatRecord!
                                                        .reference
                                                        .update({
                                                      ...createGlowUpChatRecordData(
                                                        glowUpLastMessage:
                                                            '[Image]',
                                                        glowUpSendUser:
                                                            currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'Glow_Up_UnreadMessage':
                                                              FieldValue.increment(
                                                                  columnGlowUpUserRecord
                                                                              .glowUpInChatRoom ==
                                                                          glowUpChatPageGlowUpChatRecord
                                                                              .reference
                                                                      ? 0
                                                                      : 1),
                                                          'Glow_Up_SendTime':
                                                              FieldValue
                                                                  .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                  }

                                                  _model.glowUpUploadedFilePath =
                                                      _model.uploadedFileUrl1;
                                                  return;
                                                } else {
                                                  return;
                                                }
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/Glow_Up_ChatImage.png',
                                                  width: 32.0,
                                                  height: 32.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (_model.glowUpOpenAudioMic)
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 26.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.glowUpRecordAudio) {
                                                await stopAudioRecording(
                                                  audioRecorder:
                                                      _model.audioRecorder,
                                                  audioName:
                                                      'recordedFileBytes.mp3',
                                                  onRecordingComplete:
                                                      (audioFilePath,
                                                          audioBytes) {
                                                    _model.glowUpSendAudio =
                                                        audioFilePath;
                                                    _model.recordedFileBytes =
                                                        audioBytes;
                                                  },
                                                );

                                                setState(() {
                                                  _model.glowUpRecordAudio =
                                                      false;
                                                });
                                                {
                                                  setState(() => _model
                                                      .isDataUploading2 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];
                                                  var selectedFiles =
                                                      <SelectedFile>[];
                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles = _model
                                                            .recordedFileBytes
                                                            .bytes!
                                                            .isNotEmpty
                                                        ? [
                                                            _model
                                                                .recordedFileBytes
                                                          ]
                                                        : <FFUploadedFile>[];
                                                    selectedFiles =
                                                        selectedFilesFromUploadedFiles(
                                                      selectedUploadedFiles,
                                                    );
                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedFiles.map(
                                                        (f) async =>
                                                            await uploadData(
                                                                f.storagePath,
                                                                f.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading2 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedFiles
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedFiles
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile2 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl2 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                await GlowUpChatMessagesRecord
                                                    .collection
                                                    .doc()
                                                    .set({
                                                  ...createGlowUpChatMessagesRecordData(
                                                    glowUpSendUser:
                                                        currentUserReference,
                                                    glowUpChatRoom: widget
                                                                .glowUpChat !=
                                                            null
                                                        ? widget.glowUpChat
                                                            ?.reference
                                                        : glowUpChatPageGlowUpChatRecord
                                                            ?.reference,
                                                    glowUpShowSendTime: (glowUpChatPageGlowUpChatRecord
                                                                    ?.glowUpSendTime !=
                                                                null
                                                            ? functions.glowUpTimeDifference(
                                                                glowUpChatPageGlowUpChatRecord!
                                                                    .glowUpSendTime!,
                                                                getCurrentTimestamp)
                                                            : 300) >=
                                                        300,
                                                    glowUpAudioTime: functions
                                                        .glowUpTimeDifference(
                                                            _model
                                                                .glowUpRecordAudioTime!,
                                                            getCurrentTimestamp),
                                                    glowUpAudioPath:
                                                        _model.uploadedFileUrl2,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'Glow_Up_SendTime':
                                                          FieldValue
                                                              .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                if (widget.glowUpChat != null) {
                                                  await widget
                                                      .glowUpChat!.reference
                                                      .update({
                                                    ...createGlowUpChatRecordData(
                                                      glowUpSendUser:
                                                          currentUserReference,
                                                      glowUpLastMessage:
                                                          '[Audio]',
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'Glow_Up_UnreadMessage':
                                                            FieldValue.increment(
                                                                columnGlowUpUserRecord
                                                                            .glowUpInChatRoom ==
                                                                        widget
                                                                            .glowUpChat
                                                                            ?.reference
                                                                    ? 0
                                                                    : 1),
                                                        'Glow_Up_SendTime':
                                                            FieldValue
                                                                .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  await glowUpChatPageGlowUpChatRecord!
                                                      .reference
                                                      .update({
                                                    ...createGlowUpChatRecordData(
                                                      glowUpSendUser:
                                                          currentUserReference,
                                                      glowUpLastMessage:
                                                          '[Audio]',
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'Glow_Up_UnreadMessage':
                                                            FieldValue.increment(
                                                                columnGlowUpUserRecord
                                                                            .glowUpInChatRoom ==
                                                                        glowUpChatPageGlowUpChatRecord
                                                                            .reference
                                                                    ? 0
                                                                    : 1),
                                                        'Glow_Up_SendTime':
                                                            FieldValue
                                                                .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                }

                                                _model.glowUpRecordAudioTime =
                                                    getCurrentTimestamp;
                                              } else {
                                                await startAudioRecording(
                                                  context,
                                                  audioRecorder:
                                                      _model.audioRecorder ??=
                                                          AudioRecorder(),
                                                );

                                                setState(() {
                                                  _model.glowUpRecordAudio =
                                                      true;
                                                  _model.glowUpRecordAudioTime =
                                                      getCurrentTimestamp;
                                                });
                                              }

                                              setState(() {});
                                            },
                                            child: ClipOval(
                                              child: Container(
                                                width: 78.0,
                                                height: 78.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0x67F22853),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (_model
                                                        .glowUpRecordAudio) {
                                                      return Container(
                                                        width: 68.0,
                                                        height: 68.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .logoColor,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.pause,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 26.0,
                                                        ),
                                                      );
                                                    } else {
                                                      return Container(
                                                        width: 68.0,
                                                        height: 68.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .logoColor,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.mic,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 26.0,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
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
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

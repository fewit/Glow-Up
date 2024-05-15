import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'message_page_model.dart';
export 'message_page_model.dart';

class MessagePageWidget extends StatefulWidget {
  const MessagePageWidget({super.key});

  @override
  State<MessagePageWidget> createState() => _MessagePageWidgetState();
}

class _MessagePageWidgetState extends State<MessagePageWidget> {
  late MessagePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessagePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().GlowUpNavPage = 'Chat';
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Message.',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'MiSans',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: StreamBuilder<List<GlowUpChatRecord>>(
                        stream: _model.glowUpUserChats(
                          requestFn: () => queryGlowUpChatRecord(
                            queryBuilder: (glowUpChatRecord) =>
                                glowUpChatRecord.where(
                              'Glow_Up_ChatUsers',
                              arrayContains: currentUserReference,
                            ),
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
                          List<GlowUpChatRecord> rowGlowUpChatRecordList =
                              snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                rowGlowUpChatRecordList.length, (rowIndex) {
                              final rowGlowUpChatRecord =
                                  rowGlowUpChatRecordList[rowIndex];
                              return Visibility(
                                visible: !(currentUserDocument?.glowUpBlockList
                                            .toList() ??
                                        [])
                                    .contains(rowGlowUpChatRecord
                                        .glowUpChatUsers
                                        .where((e) => e != currentUserReference)
                                        .toList()
                                        .first),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<GlowUpUserRecord>(
                                      stream: GlowUpUserRecord.getDocument(
                                          rowGlowUpChatRecord.glowUpChatUsers
                                              .where((e) =>
                                                  e != currentUserReference)
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
                                        final columnGlowUpUserRecord =
                                            snapshot.data!;
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Glow_Up_ChatPage',
                                              queryParameters: {
                                                'glowUpChat': serializeParam(
                                                  rowGlowUpChatRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'glowUpChat':
                                                    rowGlowUpChatRecord,
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 68.0,
                                                height: 62.0,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(31.0),
                                                        child: Image.network(
                                                          columnGlowUpUserRecord
                                                              .photoUrl,
                                                          width: 62.0,
                                                          height: 62.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    if (columnGlowUpUserRecord
                                                        .glowUpIsOnline)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width: 12.0,
                                                          height: 12.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .logoColor,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 6.0, 0.0),
                                                child: Text(
                                                  columnGlowUpUserRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SourceHanSans',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 73.0, 20.0, 0.0),
                      child: StreamBuilder<List<GlowUpChatRecord>>(
                        stream: _model.glowUpUserChats(
                          requestFn: () => queryGlowUpChatRecord(
                            queryBuilder: (glowUpChatRecord) =>
                                glowUpChatRecord.where(
                              'Glow_Up_ChatUsers',
                              arrayContains: currentUserReference,
                            ),
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
                          List<GlowUpChatRecord> columnGlowUpChatRecordList =
                              snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(columnGlowUpChatRecordList.length,
                                    (columnIndex) {
                              final columnGlowUpChatRecord =
                                  columnGlowUpChatRecordList[columnIndex];
                              return Visibility(
                                visible:
                                    (columnGlowUpChatRecord.glowUpSendUser !=
                                            null) &&
                                        !(currentUserDocument?.glowUpBlockList
                                                    .toList() ??
                                                [])
                                            .contains(columnGlowUpChatRecord
                                                .glowUpChatUsers
                                                .where((e) =>
                                                    e != currentUserReference)
                                                .toList()
                                                .first),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Glow_Up_ChatPage',
                                        queryParameters: {
                                          'glowUpChat': serializeParam(
                                            columnGlowUpChatRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'glowUpChat': columnGlowUpChatRecord,
                                        },
                                      );

                                      await currentUserReference!
                                          .update(createGlowUpUserRecordData(
                                        glowUpInChatRoom:
                                            columnGlowUpChatRecord.reference,
                                      ));
                                      if (columnGlowUpChatRecord
                                              .glowUpSendUser !=
                                          currentUserReference) {
                                        await columnGlowUpChatRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'Glow_Up_UnreadMessage':
                                                  FieldValue.delete(),
                                            },
                                          ),
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 55.0,
                                      decoration: const BoxDecoration(),
                                      child: StreamBuilder<GlowUpUserRecord>(
                                        stream: GlowUpUserRecord.getDocument(
                                            columnGlowUpChatRecord
                                                .glowUpChatUsers
                                                .where((e) =>
                                                    e != currentUserReference)
                                                .toList()
                                                .first),
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
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 58.0,
                                                height: 52.0,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(31.0),
                                                        child: Image.network(
                                                          rowGlowUpUserRecord
                                                              .photoUrl,
                                                          width: 52.0,
                                                          height: 52.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    if ((columnGlowUpChatRecord
                                                                .glowUpSendUser !=
                                                            currentUserReference) &&
                                                        (columnGlowUpChatRecord
                                                                .glowUpUnreadMessage >
                                                            0))
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .logoColor,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              columnGlowUpChatRecord
                                                                  .glowUpUnreadMessage
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SourceHanSans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        rowGlowUpUserRecord
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'MiSans',
                                                              fontSize: 20.0,
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
                                                        columnGlowUpChatRecord
                                                            .glowUpLastMessage,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'SourceHanSans',
                                                              color: const Color(
                                                                  0xFF646665),
                                                              fontSize: 16.0,
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
                                                ),
                                              ),
                                              Text(
                                                dateTimeFormat(
                                                    'yMMMd',
                                                    columnGlowUpChatRecord
                                                        .glowUpSendTime!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'MiSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .growUpB60,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).divide(const SizedBox(height: 20.0)),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 70.0,
                      decoration: const BoxDecoration(),
                    ),
                  ],
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
                                    context.pushNamed(
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
                                    context.pushNamed(
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
                                    context.pushNamed(
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
                                    context.pushNamed(
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
          ],
        ),
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'post_video_model.dart';
export 'post_video_model.dart';

class PostVideoWidget extends StatefulWidget {
  const PostVideoWidget({super.key});

  @override
  State<PostVideoWidget> createState() => _PostVideoWidgetState();
}

class _PostVideoWidgetState extends State<PostVideoWidget> {
  late PostVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostVideoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              await FirebaseStorage.instance
                  .refFromURL(_model.glowUpreadVideoPost!)
                  .delete();
            },
          ),
          title: Text(
            'video',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'MiSans',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 20.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: false,
                        textCapitalization: TextCapitalization.none,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Enter the content you want to post...',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'SourceHanSans',
                                    color: const Color(0xFFAAACB3),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w100,
                                    useGoogleFonts: false,
                                  ),
                          alignLabelWithHint: true,
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        maxLines: 5,
                        maxLength: 50,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        width: valueOrDefault<double>(
                          functions.glowUpMultiplication(
                              0.9, MediaQuery.sizeOf(context).width),
                          335.0,
                        ),
                        height: valueOrDefault<double>(
                          functions.glowUpMultiplication(
                              0.9, MediaQuery.sizeOf(context).width),
                          335.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (_model.glowUpreadVideoPost == null ||
                                _model.glowUpreadVideoPost == '') {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: false,
                                    allowVideo: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  setState(() {
                                    _model.glowUpreadVideoPost =
                                        _model.uploadedFileUrl;
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Glow_Up_postDotBorder.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .logoColor,
                                        size: 32.0,
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 3.0,
                                          height: 13.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Stack(
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      width: 335.0,
                                      height: 335.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FlutterFlowVideoPlayer(
                                        path: _model.uploadedFileUrl,
                                        videoType: VideoType.network,
                                        autoPlay: false,
                                        looping: false,
                                        showControls: false,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                        lazyLoad: false,
                                        pauseOnNavigate: false,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0x981A100E),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: const Color(0x65FFFFFF),
                                        ),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        fillColor: const Color(0x1AFFFFFF),
                                        icon: FaIcon(
                                          FontAwesomeIcons.play,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 12.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await FirebaseStorage.instance
                                              .refFromURL(
                                                  _model.uploadedFileUrl)
                                              .delete();
                                          setState(() {
                                            _model.glowUpreadVideoPost = null;
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 36.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.glowUpreadVideoPost != null &&
                          _model.glowUpreadVideoPost != '') {
                        await GlowUpPostRecord.collection
                            .doc()
                            .set(createGlowUpPostRecordData(
                              glowUpContent: _model.textController.text,
                              glowUpVideoPath: _model.glowUpreadVideoPost,
                              glowUpIsVideo: true,
                              glowUpCreateUser: currentUserReference,
                              glowUpHot: 0,
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Success',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: FlutterFlowTheme.of(context).logoColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                            duration: const Duration(milliseconds: 2000),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                        context.safePop();
                      } else {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please add the contents of the post',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: FlutterFlowTheme.of(context).logoColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                            duration: const Duration(milliseconds: 2000),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                      }
                    },
                    text: 'Post',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).logoColor,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

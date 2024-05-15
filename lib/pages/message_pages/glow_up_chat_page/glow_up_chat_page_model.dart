import '/flutter_flow/flutter_flow_util.dart';
import 'glow_up_chat_page_widget.dart' show GlowUpChatPageWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

class GlowUpChatPageModel extends FlutterFlowModel<GlowUpChatPageWidget> {
  ///  Local state fields for this page.

  bool glowUpChatOpenTools = false;

  bool glowUpOpenAudioMic = false;

  String? glowUpUploadedFilePath;

  bool glowUpRecordAudio = false;

  DateTime? glowUpRecordAudioTime;

  bool glowUpIsPlayAudio = false;

  String? glowUpPlayedMessage;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  // State field(s) for Glow_Up_ChatText widget.
  FocusNode? glowUpChatTextFocusNode;
  TextEditingController? glowUpChatTextTextController;
  String? Function(BuildContext, String?)?
      glowUpChatTextTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  String? glowUpSendAudio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  AudioRecorder? audioRecorder;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    glowUpChatTextFocusNode?.dispose();
    glowUpChatTextTextController?.dispose();
  }
}

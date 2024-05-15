import '/flutter_flow/flutter_flow_util.dart';
import 'post_video_widget.dart' show PostVideoWidget;
import 'package:flutter/material.dart';

class PostVideoModel extends FlutterFlowModel<PostVideoWidget> {
  ///  Local state fields for this page.

  String? glowUpreadVideoPost;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

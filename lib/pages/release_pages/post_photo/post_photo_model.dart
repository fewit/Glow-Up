import '/flutter_flow/flutter_flow_util.dart';
import 'post_photo_widget.dart' show PostPhotoWidget;
import 'package:flutter/material.dart';

class PostPhotoModel extends FlutterFlowModel<PostPhotoWidget> {
  ///  Local state fields for this page.

  List<String> glowUpPhotos = ['none'];
  void addToGlowUpPhotos(String item) => glowUpPhotos.add(item);
  void removeFromGlowUpPhotos(String item) => glowUpPhotos.remove(item);
  void removeAtIndexFromGlowUpPhotos(int index) => glowUpPhotos.removeAt(index);
  void insertAtIndexInGlowUpPhotos(int index, String item) =>
      glowUpPhotos.insert(index, item);
  void updateGlowUpPhotosAtIndex(int index, Function(String) updateFn) =>
      glowUpPhotos[index] = updateFn(glowUpPhotos[index]);

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

  // Stores action output result for [Custom Action - glowUpPostListChange] action in Stack widget.
  List<String>? glowUpNewPathList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

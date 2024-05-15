import '/flutter_flow/flutter_flow_util.dart';
import 'editing_information_widget.dart' show EditingInformationWidget;
import 'package:flutter/material.dart';

class EditingInformationModel
    extends FlutterFlowModel<EditingInformationWidget> {
  ///  Local state fields for this page.

  String? growUpInProfilepicture;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for GrowUp_small_username widget.
  FocusNode? growUpSmallUsernameFocusNode;
  TextEditingController? growUpSmallUsernameTextController;
  String? Function(BuildContext, String?)?
      growUpSmallUsernameTextControllerValidator;
  String? _growUpSmallUsernameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for GrowUp_strong_describe widget.
  FocusNode? growUpStrongDescribeFocusNode;
  TextEditingController? growUpStrongDescribeTextController;
  String? Function(BuildContext, String?)?
      growUpStrongDescribeTextControllerValidator;

  @override
  void initState(BuildContext context) {
    growUpSmallUsernameTextControllerValidator =
        _growUpSmallUsernameTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    growUpSmallUsernameFocusNode?.dispose();
    growUpSmallUsernameTextController?.dispose();

    growUpStrongDescribeFocusNode?.dispose();
    growUpStrongDescribeTextController?.dispose();
  }
}

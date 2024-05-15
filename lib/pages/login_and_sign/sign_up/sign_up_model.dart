import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for GrowUp_small_email widget.
  FocusNode? growUpSmallEmailFocusNode;
  TextEditingController? growUpSmallEmailTextController;
  String? Function(BuildContext, String?)?
      growUpSmallEmailTextControllerValidator;
  String? _growUpSmallEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter email';
    }
    return null;
  }

  // State field(s) for GrowUp_strong_password widget.
  FocusNode? growUpStrongPasswordFocusNode;
  TextEditingController? growUpStrongPasswordTextController;
  late bool growUpStrongPasswordVisibility;
  String? Function(BuildContext, String?)?
      growUpStrongPasswordTextControllerValidator;
  String? _growUpStrongPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter password';
    }

    return null;
  }

  // State field(s) for GrowUp_strong_password2 widget.
  FocusNode? growUpStrongPassword2FocusNode;
  TextEditingController? growUpStrongPassword2TextController;
  late bool growUpStrongPassword2Visibility;
  String? Function(BuildContext, String?)?
      growUpStrongPassword2TextControllerValidator;
  String? _growUpStrongPassword2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter password again';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    growUpSmallEmailTextControllerValidator =
        _growUpSmallEmailTextControllerValidator;
    growUpStrongPasswordVisibility = false;
    growUpStrongPasswordTextControllerValidator =
        _growUpStrongPasswordTextControllerValidator;
    growUpStrongPassword2Visibility = false;
    growUpStrongPassword2TextControllerValidator =
        _growUpStrongPassword2TextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    growUpSmallEmailFocusNode?.dispose();
    growUpSmallEmailTextController?.dispose();

    growUpStrongPasswordFocusNode?.dispose();
    growUpStrongPasswordTextController?.dispose();

    growUpStrongPassword2FocusNode?.dispose();
    growUpStrongPassword2TextController?.dispose();
  }
}

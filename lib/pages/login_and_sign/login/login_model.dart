import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
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
      return 'Please enter the correct email ';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter a email';
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
      return 'Please enter the correct password';
    }

    if (val.length < 6) {
      return 'The password must have at least 6 digits';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    growUpSmallEmailTextControllerValidator =
        _growUpSmallEmailTextControllerValidator;
    growUpStrongPasswordVisibility = false;
    growUpStrongPasswordTextControllerValidator =
        _growUpStrongPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    growUpSmallEmailFocusNode?.dispose();
    growUpSmallEmailTextController?.dispose();

    growUpStrongPasswordFocusNode?.dispose();
    growUpStrongPasswordTextController?.dispose();
  }
}

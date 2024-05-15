import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for GrowUP_switch_email widget.
  FocusNode? growUPSwitchEmailFocusNode;
  TextEditingController? growUPSwitchEmailTextController;
  String? Function(BuildContext, String?)?
      growUPSwitchEmailTextControllerValidator;
  // State field(s) for GrowUp_strong_password widget.
  FocusNode? growUpStrongPasswordFocusNode;
  TextEditingController? growUpStrongPasswordTextController;
  late bool growUpStrongPasswordVisibility;
  String? Function(BuildContext, String?)?
      growUpStrongPasswordTextControllerValidator;
  // State field(s) for GrowUp_strong_password2 widget.
  FocusNode? growUpStrongPassword2FocusNode;
  TextEditingController? growUpStrongPassword2TextController;
  late bool growUpStrongPassword2Visibility;
  String? Function(BuildContext, String?)?
      growUpStrongPassword2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    growUpStrongPasswordVisibility = false;
    growUpStrongPassword2Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    growUPSwitchEmailFocusNode?.dispose();
    growUPSwitchEmailTextController?.dispose();

    growUpStrongPasswordFocusNode?.dispose();
    growUpStrongPasswordTextController?.dispose();

    growUpStrongPassword2FocusNode?.dispose();
    growUpStrongPassword2TextController?.dispose();
  }
}

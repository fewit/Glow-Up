import '/flutter_flow/flutter_flow_util.dart';
import 'glow_up_offer_comments_widget.dart' show GlowUpOfferCommentsWidget;
import 'package:flutter/material.dart';

class GlowUpOfferCommentsModel
    extends FlutterFlowModel<GlowUpOfferCommentsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();
  }
}

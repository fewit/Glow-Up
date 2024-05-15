import '/flutter_flow/flutter_flow_util.dart';
import 'followed_widget.dart' show FollowedWidget;
import 'package:flutter/material.dart';

class FollowedModel extends FlutterFlowModel<FollowedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'recommend_page_widget.dart' show RecommendPageWidget;
import 'package:flutter/material.dart';

class RecommendPageModel extends FlutterFlowModel<RecommendPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

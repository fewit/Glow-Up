import '/flutter_flow/flutter_flow_util.dart';
import 'release_page_widget.dart' show ReleasePageWidget;
import 'package:flutter/material.dart';

class ReleasePageModel extends FlutterFlowModel<ReleasePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

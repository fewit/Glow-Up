import '/flutter_flow/flutter_flow_util.dart';
import 'blocklist_widget.dart' show BlocklistWidget;
import 'package:flutter/material.dart';

class BlocklistModel extends FlutterFlowModel<BlocklistWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

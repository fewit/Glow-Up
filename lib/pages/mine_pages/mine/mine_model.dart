import '/flutter_flow/flutter_flow_util.dart';
import 'mine_widget.dart' show MineWidget;
import 'package:flutter/material.dart';

class MineModel extends FlutterFlowModel<MineWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}

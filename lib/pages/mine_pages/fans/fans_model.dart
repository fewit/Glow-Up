import '/flutter_flow/flutter_flow_util.dart';
import 'fans_widget.dart' show FansWidget;
import 'package:flutter/material.dart';

class FansModel extends FlutterFlowModel<FansWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

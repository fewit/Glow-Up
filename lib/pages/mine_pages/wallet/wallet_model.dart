import '/flutter_flow/flutter_flow_util.dart';
import 'wallet_widget.dart' show WalletWidget;
import 'package:flutter/material.dart';

class WalletModel extends FlutterFlowModel<WalletWidget> {
  ///  Local state fields for this page.

  int glowUpChecked = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

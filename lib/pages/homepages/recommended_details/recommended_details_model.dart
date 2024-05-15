import '/flutter_flow/flutter_flow_util.dart';
import 'recommended_details_widget.dart' show RecommendedDetailsWidget;
import 'package:flutter/material.dart';

class RecommendedDetailsModel
    extends FlutterFlowModel<RecommendedDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

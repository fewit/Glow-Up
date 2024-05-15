import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, GlowUpPostRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, GlowUpPostRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, GlowUpPostRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, GlowUpPostRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryGlowUpPostRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }
}

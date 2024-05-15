import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_page_widget.dart' show VideoPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class VideoPageModel extends FlutterFlowModel<VideoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  int pageViewLoadedLength = 3;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  PagingController<DocumentSnapshot?, GlowUpPostRecord>?
      pageViewPagingController;
  Query? pageViewPagingQuery;
  List<StreamSubscription?> pageViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in pageViewStreamSubscriptions) {
      s?.cancel();
    }
    pageViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, GlowUpPostRecord> setPageViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    pageViewPagingController ??= _createPageViewController(query, parent);
    if (pageViewPagingQuery != query) {
      pageViewPagingQuery = query;
      pageViewPagingController?.refresh();
    }
    return pageViewPagingController!;
  }

  PagingController<DocumentSnapshot?, GlowUpPostRecord>
      _createPageViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, GlowUpPostRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryGlowUpPostRecordPage(
          queryBuilder: (_) => pageViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: pageViewStreamSubscriptions,
          controller: controller,
          pageSize: 3,
          isStream: true,
        ),
      );
  }
}

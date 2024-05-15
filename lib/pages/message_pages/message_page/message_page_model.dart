import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'message_page_widget.dart' show MessagePageWidget;
import 'package:flutter/material.dart';

class MessagePageModel extends FlutterFlowModel<MessagePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Query cache managers for this widget.

  final _glowUpUserChatsManager =
      StreamRequestManager<List<GlowUpChatRecord>>();
  Stream<List<GlowUpChatRecord>> glowUpUserChats({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<GlowUpChatRecord>> Function() requestFn,
  }) =>
      _glowUpUserChatsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGlowUpUserChatsCache() => _glowUpUserChatsManager.clear();
  void clearGlowUpUserChatsCacheKey(String? uniqueKey) =>
      _glowUpUserChatsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearGlowUpUserChatsCache();
  }
}

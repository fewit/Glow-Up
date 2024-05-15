import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/glow_up_user_record.dart';
import 'schema/glow_up_post_record.dart';
import 'schema/glow_up_post_comment_record.dart';
import 'schema/glow_up_chat_record.dart';
import 'schema/glow_up_chat_messages_record.dart';
import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/glow_up_user_record.dart';
export 'schema/glow_up_post_record.dart';
export 'schema/glow_up_post_comment_record.dart';
export 'schema/glow_up_chat_record.dart';
export 'schema/glow_up_chat_messages_record.dart';

/// Functions to query GlowUpUserRecords (as a Stream and as a Future).
Future<int> queryGlowUpUserRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      GlowUpUserRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<GlowUpUserRecord>> queryGlowUpUserRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      GlowUpUserRecord.collection,
      GlowUpUserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<GlowUpUserRecord>> queryGlowUpUserRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      GlowUpUserRecord.collection,
      GlowUpUserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<GlowUpUserRecord>> queryGlowUpUserRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, GlowUpUserRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      GlowUpUserRecord.collection,
      GlowUpUserRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<GlowUpUserRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query GlowUpPostRecords (as a Stream and as a Future).
Future<int> queryGlowUpPostRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      GlowUpPostRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<GlowUpPostRecord>> queryGlowUpPostRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      GlowUpPostRecord.collection,
      GlowUpPostRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<GlowUpPostRecord>> queryGlowUpPostRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      GlowUpPostRecord.collection,
      GlowUpPostRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<GlowUpPostRecord>> queryGlowUpPostRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, GlowUpPostRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      GlowUpPostRecord.collection,
      GlowUpPostRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<GlowUpPostRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query GlowUpPostCommentRecords (as a Stream and as a Future).
Future<int> queryGlowUpPostCommentRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      GlowUpPostCommentRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<GlowUpPostCommentRecord>> queryGlowUpPostCommentRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      GlowUpPostCommentRecord.collection,
      GlowUpPostCommentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<GlowUpPostCommentRecord>> queryGlowUpPostCommentRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      GlowUpPostCommentRecord.collection,
      GlowUpPostCommentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<GlowUpPostCommentRecord>>
    queryGlowUpPostCommentRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, GlowUpPostCommentRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          GlowUpPostCommentRecord.collection,
          GlowUpPostCommentRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription =
                (page.dataStream)?.listen((List<GlowUpPostCommentRecord> data) {
              for (var item in data) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              }
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

/// Functions to query GlowUpChatRecords (as a Stream and as a Future).
Future<int> queryGlowUpChatRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      GlowUpChatRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<GlowUpChatRecord>> queryGlowUpChatRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      GlowUpChatRecord.collection,
      GlowUpChatRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<GlowUpChatRecord>> queryGlowUpChatRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      GlowUpChatRecord.collection,
      GlowUpChatRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<GlowUpChatRecord>> queryGlowUpChatRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, GlowUpChatRecord> controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
    queryCollectionPage(
      GlowUpChatRecord.collection,
      GlowUpChatRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    ).then((page) {
      controller.appendPage(
        page.data,
        page.nextPageMarker,
      );
      if (isStream) {
        final streamSubscription =
            (page.dataStream)?.listen((List<GlowUpChatRecord> data) {
          for (var item in data) {
            final itemIndexes = controller.itemList!
                .asMap()
                .map((k, v) => MapEntry(v.reference.id, k));
            final index = itemIndexes[item.reference.id];
            final items = controller.itemList!;
            if (index != null) {
              items.replaceRange(index, index + 1, [item]);
              controller.itemList = {
                for (var item in items) item.reference: item
              }.values.toList();
            }
          }
        });
        streamSubscriptions?.add(streamSubscription);
      }
      return page;
    });

/// Functions to query GlowUpChatMessagesRecords (as a Stream and as a Future).
Future<int> queryGlowUpChatMessagesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      GlowUpChatMessagesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<GlowUpChatMessagesRecord>> queryGlowUpChatMessagesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      GlowUpChatMessagesRecord.collection,
      GlowUpChatMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<GlowUpChatMessagesRecord>> queryGlowUpChatMessagesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      GlowUpChatMessagesRecord.collection,
      GlowUpChatMessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );
Future<FFFirestorePage<GlowUpChatMessagesRecord>>
    queryGlowUpChatMessagesRecordPage({
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
  required PagingController<DocumentSnapshot?, GlowUpChatMessagesRecord>
      controller,
  List<StreamSubscription?>? streamSubscriptions,
}) =>
        queryCollectionPage(
          GlowUpChatMessagesRecord.collection,
          GlowUpChatMessagesRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        ).then((page) {
          controller.appendPage(
            page.data,
            page.nextPageMarker,
          );
          if (isStream) {
            final streamSubscription = (page.dataStream)
                ?.listen((List<GlowUpChatMessagesRecord> data) {
              for (var item in data) {
                final itemIndexes = controller.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = controller.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  controller.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              }
            });
            streamSubscriptions?.add(streamSubscription);
          }
          return page;
        });

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  getDocs(QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = GlowUpUserRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await GlowUpUserRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createGlowUpUserRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument =
      GlowUpUserRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createGlowUpUserRecordData(email: email));
}

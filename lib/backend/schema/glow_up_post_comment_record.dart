import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GlowUpPostCommentRecord extends FirestoreRecord {
  GlowUpPostCommentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Glow_Up_CreateUser" field.
  DocumentReference? _glowUpCreateUser;
  DocumentReference? get glowUpCreateUser => _glowUpCreateUser;
  bool hasGlowUpCreateUser() => _glowUpCreateUser != null;

  // "Glow_Up_Comment" field.
  String? _glowUpComment;
  String get glowUpComment => _glowUpComment ?? '';
  bool hasGlowUpComment() => _glowUpComment != null;

  // "Glow_Up_ReportedList" field.
  GlowUpReportsStruct? _glowUpReportedList;
  GlowUpReportsStruct get glowUpReportedList =>
      _glowUpReportedList ?? GlowUpReportsStruct();
  bool hasGlowUpReportedList() => _glowUpReportedList != null;

  // "Glow_Up_Post" field.
  DocumentReference? _glowUpPost;
  DocumentReference? get glowUpPost => _glowUpPost;
  bool hasGlowUpPost() => _glowUpPost != null;

  void _initializeFields() {
    _glowUpCreateUser =
        snapshotData['Glow_Up_CreateUser'] as DocumentReference?;
    _glowUpComment = snapshotData['Glow_Up_Comment'] as String?;
    _glowUpReportedList =
        GlowUpReportsStruct.maybeFromMap(snapshotData['Glow_Up_ReportedList']);
    _glowUpPost = snapshotData['Glow_Up_Post'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Glow_Up_PostComment');

  static Stream<GlowUpPostCommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlowUpPostCommentRecord.fromSnapshot(s));

  static Future<GlowUpPostCommentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GlowUpPostCommentRecord.fromSnapshot(s));

  static GlowUpPostCommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlowUpPostCommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlowUpPostCommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlowUpPostCommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlowUpPostCommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlowUpPostCommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlowUpPostCommentRecordData({
  DocumentReference? glowUpCreateUser,
  String? glowUpComment,
  GlowUpReportsStruct? glowUpReportedList,
  DocumentReference? glowUpPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Glow_Up_CreateUser': glowUpCreateUser,
      'Glow_Up_Comment': glowUpComment,
      'Glow_Up_ReportedList': GlowUpReportsStruct().toMap(),
      'Glow_Up_Post': glowUpPost,
    }.withoutNulls,
  );

  // Handle nested data for "Glow_Up_ReportedList" field.
  addGlowUpReportsStructData(
      firestoreData, glowUpReportedList, 'Glow_Up_ReportedList');

  return firestoreData;
}

class GlowUpPostCommentRecordDocumentEquality
    implements Equality<GlowUpPostCommentRecord> {
  const GlowUpPostCommentRecordDocumentEquality();

  @override
  bool equals(GlowUpPostCommentRecord? e1, GlowUpPostCommentRecord? e2) {
    return e1?.glowUpCreateUser == e2?.glowUpCreateUser &&
        e1?.glowUpComment == e2?.glowUpComment &&
        e1?.glowUpReportedList == e2?.glowUpReportedList &&
        e1?.glowUpPost == e2?.glowUpPost;
  }

  @override
  int hash(GlowUpPostCommentRecord? e) => const ListEquality().hash([
        e?.glowUpCreateUser,
        e?.glowUpComment,
        e?.glowUpReportedList,
        e?.glowUpPost
      ]);

  @override
  bool isValidKey(Object? o) => o is GlowUpPostCommentRecord;
}

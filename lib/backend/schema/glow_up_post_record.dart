import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlowUpPostRecord extends FirestoreRecord {
  GlowUpPostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Glow_Up_CreateUser" field.
  DocumentReference? _glowUpCreateUser;
  DocumentReference? get glowUpCreateUser => _glowUpCreateUser;
  bool hasGlowUpCreateUser() => _glowUpCreateUser != null;

  // "Glow_Up_Content" field.
  String? _glowUpContent;
  String get glowUpContent => _glowUpContent ?? '';
  bool hasGlowUpContent() => _glowUpContent != null;

  // "Glow_Up_ImageList" field.
  List<String>? _glowUpImageList;
  List<String> get glowUpImageList => _glowUpImageList ?? const [];
  bool hasGlowUpImageList() => _glowUpImageList != null;

  // "Glow_Up_VideoPath" field.
  String? _glowUpVideoPath;
  String get glowUpVideoPath => _glowUpVideoPath ?? '';
  bool hasGlowUpVideoPath() => _glowUpVideoPath != null;

  // "Glow_Up_IsVideo" field.
  bool? _glowUpIsVideo;
  bool get glowUpIsVideo => _glowUpIsVideo ?? false;
  bool hasGlowUpIsVideo() => _glowUpIsVideo != null;

  // "Glow_Up_ReportedList" field.
  List<GlowUpReportsStruct>? _glowUpReportedList;
  List<GlowUpReportsStruct> get glowUpReportedList =>
      _glowUpReportedList ?? const [];
  bool hasGlowUpReportedList() => _glowUpReportedList != null;

  // "Glow_Up_Hot" field.
  int? _glowUpHot;
  int get glowUpHot => _glowUpHot ?? 0;
  bool hasGlowUpHot() => _glowUpHot != null;

  // "Glow_Up_ReadNum" field.
  int? _glowUpReadNum;
  int get glowUpReadNum => _glowUpReadNum ?? 0;
  bool hasGlowUpReadNum() => _glowUpReadNum != null;

  void _initializeFields() {
    _glowUpCreateUser =
        snapshotData['Glow_Up_CreateUser'] as DocumentReference?;
    _glowUpContent = snapshotData['Glow_Up_Content'] as String?;
    _glowUpImageList = getDataList(snapshotData['Glow_Up_ImageList']);
    _glowUpVideoPath = snapshotData['Glow_Up_VideoPath'] as String?;
    _glowUpIsVideo = snapshotData['Glow_Up_IsVideo'] as bool?;
    _glowUpReportedList = getStructList(
      snapshotData['Glow_Up_ReportedList'],
      GlowUpReportsStruct.fromMap,
    );
    _glowUpHot = castToType<int>(snapshotData['Glow_Up_Hot']);
    _glowUpReadNum = castToType<int>(snapshotData['Glow_Up_ReadNum']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Glow_Up_Post');

  static Stream<GlowUpPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlowUpPostRecord.fromSnapshot(s));

  static Future<GlowUpPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GlowUpPostRecord.fromSnapshot(s));

  static GlowUpPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlowUpPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlowUpPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlowUpPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlowUpPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlowUpPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlowUpPostRecordData({
  DocumentReference? glowUpCreateUser,
  String? glowUpContent,
  String? glowUpVideoPath,
  bool? glowUpIsVideo,
  int? glowUpHot,
  int? glowUpReadNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Glow_Up_CreateUser': glowUpCreateUser,
      'Glow_Up_Content': glowUpContent,
      'Glow_Up_VideoPath': glowUpVideoPath,
      'Glow_Up_IsVideo': glowUpIsVideo,
      'Glow_Up_Hot': glowUpHot,
      'Glow_Up_ReadNum': glowUpReadNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlowUpPostRecordDocumentEquality implements Equality<GlowUpPostRecord> {
  const GlowUpPostRecordDocumentEquality();

  @override
  bool equals(GlowUpPostRecord? e1, GlowUpPostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.glowUpCreateUser == e2?.glowUpCreateUser &&
        e1?.glowUpContent == e2?.glowUpContent &&
        listEquality.equals(e1?.glowUpImageList, e2?.glowUpImageList) &&
        e1?.glowUpVideoPath == e2?.glowUpVideoPath &&
        e1?.glowUpIsVideo == e2?.glowUpIsVideo &&
        listEquality.equals(e1?.glowUpReportedList, e2?.glowUpReportedList) &&
        e1?.glowUpHot == e2?.glowUpHot &&
        e1?.glowUpReadNum == e2?.glowUpReadNum;
  }

  @override
  int hash(GlowUpPostRecord? e) => const ListEquality().hash([
        e?.glowUpCreateUser,
        e?.glowUpContent,
        e?.glowUpImageList,
        e?.glowUpVideoPath,
        e?.glowUpIsVideo,
        e?.glowUpReportedList,
        e?.glowUpHot,
        e?.glowUpReadNum
      ]);

  @override
  bool isValidKey(Object? o) => o is GlowUpPostRecord;
}

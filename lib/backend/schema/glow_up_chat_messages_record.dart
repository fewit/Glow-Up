import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlowUpChatMessagesRecord extends FirestoreRecord {
  GlowUpChatMessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Glow_Up_SendUser" field.
  DocumentReference? _glowUpSendUser;
  DocumentReference? get glowUpSendUser => _glowUpSendUser;
  bool hasGlowUpSendUser() => _glowUpSendUser != null;

  // "Glow_Up_Content" field.
  String? _glowUpContent;
  String get glowUpContent => _glowUpContent ?? '';
  bool hasGlowUpContent() => _glowUpContent != null;

  // "Glow_Up_ImagePath" field.
  String? _glowUpImagePath;
  String get glowUpImagePath => _glowUpImagePath ?? '';
  bool hasGlowUpImagePath() => _glowUpImagePath != null;

  // "Glow_Up_AudioPath" field.
  String? _glowUpAudioPath;
  String get glowUpAudioPath => _glowUpAudioPath ?? '';
  bool hasGlowUpAudioPath() => _glowUpAudioPath != null;

  // "Glow_Up_AudioTime" field.
  int? _glowUpAudioTime;
  int get glowUpAudioTime => _glowUpAudioTime ?? 0;
  bool hasGlowUpAudioTime() => _glowUpAudioTime != null;

  // "Glow_Up_SendTime" field.
  DateTime? _glowUpSendTime;
  DateTime? get glowUpSendTime => _glowUpSendTime;
  bool hasGlowUpSendTime() => _glowUpSendTime != null;

  // "Glow_Up_ShowSendTime" field.
  bool? _glowUpShowSendTime;
  bool get glowUpShowSendTime => _glowUpShowSendTime ?? false;
  bool hasGlowUpShowSendTime() => _glowUpShowSendTime != null;

  // "Glow_Up_ChatRoom" field.
  DocumentReference? _glowUpChatRoom;
  DocumentReference? get glowUpChatRoom => _glowUpChatRoom;
  bool hasGlowUpChatRoom() => _glowUpChatRoom != null;

  void _initializeFields() {
    _glowUpSendUser = snapshotData['Glow_Up_SendUser'] as DocumentReference?;
    _glowUpContent = snapshotData['Glow_Up_Content'] as String?;
    _glowUpImagePath = snapshotData['Glow_Up_ImagePath'] as String?;
    _glowUpAudioPath = snapshotData['Glow_Up_AudioPath'] as String?;
    _glowUpAudioTime = castToType<int>(snapshotData['Glow_Up_AudioTime']);
    _glowUpSendTime = snapshotData['Glow_Up_SendTime'] as DateTime?;
    _glowUpShowSendTime = snapshotData['Glow_Up_ShowSendTime'] as bool?;
    _glowUpChatRoom = snapshotData['Glow_Up_ChatRoom'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Glow_Up_ChatMessages');

  static Stream<GlowUpChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlowUpChatMessagesRecord.fromSnapshot(s));

  static Future<GlowUpChatMessagesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GlowUpChatMessagesRecord.fromSnapshot(s));

  static GlowUpChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlowUpChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlowUpChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlowUpChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlowUpChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlowUpChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlowUpChatMessagesRecordData({
  DocumentReference? glowUpSendUser,
  String? glowUpContent,
  String? glowUpImagePath,
  String? glowUpAudioPath,
  int? glowUpAudioTime,
  DateTime? glowUpSendTime,
  bool? glowUpShowSendTime,
  DocumentReference? glowUpChatRoom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Glow_Up_SendUser': glowUpSendUser,
      'Glow_Up_Content': glowUpContent,
      'Glow_Up_ImagePath': glowUpImagePath,
      'Glow_Up_AudioPath': glowUpAudioPath,
      'Glow_Up_AudioTime': glowUpAudioTime,
      'Glow_Up_SendTime': glowUpSendTime,
      'Glow_Up_ShowSendTime': glowUpShowSendTime,
      'Glow_Up_ChatRoom': glowUpChatRoom,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlowUpChatMessagesRecordDocumentEquality
    implements Equality<GlowUpChatMessagesRecord> {
  const GlowUpChatMessagesRecordDocumentEquality();

  @override
  bool equals(GlowUpChatMessagesRecord? e1, GlowUpChatMessagesRecord? e2) {
    return e1?.glowUpSendUser == e2?.glowUpSendUser &&
        e1?.glowUpContent == e2?.glowUpContent &&
        e1?.glowUpImagePath == e2?.glowUpImagePath &&
        e1?.glowUpAudioPath == e2?.glowUpAudioPath &&
        e1?.glowUpAudioTime == e2?.glowUpAudioTime &&
        e1?.glowUpSendTime == e2?.glowUpSendTime &&
        e1?.glowUpShowSendTime == e2?.glowUpShowSendTime &&
        e1?.glowUpChatRoom == e2?.glowUpChatRoom;
  }

  @override
  int hash(GlowUpChatMessagesRecord? e) => const ListEquality().hash([
        e?.glowUpSendUser,
        e?.glowUpContent,
        e?.glowUpImagePath,
        e?.glowUpAudioPath,
        e?.glowUpAudioTime,
        e?.glowUpSendTime,
        e?.glowUpShowSendTime,
        e?.glowUpChatRoom
      ]);

  @override
  bool isValidKey(Object? o) => o is GlowUpChatMessagesRecord;
}

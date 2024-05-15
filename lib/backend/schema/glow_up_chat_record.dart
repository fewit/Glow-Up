import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlowUpChatRecord extends FirestoreRecord {
  GlowUpChatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Glow_Up_ChatUsers" field.
  List<DocumentReference>? _glowUpChatUsers;
  List<DocumentReference> get glowUpChatUsers => _glowUpChatUsers ?? const [];
  bool hasGlowUpChatUsers() => _glowUpChatUsers != null;

  // "Glow_Up_SendUser" field.
  DocumentReference? _glowUpSendUser;
  DocumentReference? get glowUpSendUser => _glowUpSendUser;
  bool hasGlowUpSendUser() => _glowUpSendUser != null;

  // "Glow_Up_SendTime" field.
  DateTime? _glowUpSendTime;
  DateTime? get glowUpSendTime => _glowUpSendTime;
  bool hasGlowUpSendTime() => _glowUpSendTime != null;

  // "Glow_Up_LastMessage" field.
  String? _glowUpLastMessage;
  String get glowUpLastMessage => _glowUpLastMessage ?? '';
  bool hasGlowUpLastMessage() => _glowUpLastMessage != null;

  // "Glow_Up_UnreadMessage" field.
  int? _glowUpUnreadMessage;
  int get glowUpUnreadMessage => _glowUpUnreadMessage ?? 0;
  bool hasGlowUpUnreadMessage() => _glowUpUnreadMessage != null;

  void _initializeFields() {
    _glowUpChatUsers = getDataList(snapshotData['Glow_Up_ChatUsers']);
    _glowUpSendUser = snapshotData['Glow_Up_SendUser'] as DocumentReference?;
    _glowUpSendTime = snapshotData['Glow_Up_SendTime'] as DateTime?;
    _glowUpLastMessage = snapshotData['Glow_Up_LastMessage'] as String?;
    _glowUpUnreadMessage =
        castToType<int>(snapshotData['Glow_Up_UnreadMessage']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Glow_Up_Chat');

  static Stream<GlowUpChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlowUpChatRecord.fromSnapshot(s));

  static Future<GlowUpChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GlowUpChatRecord.fromSnapshot(s));

  static GlowUpChatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlowUpChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlowUpChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlowUpChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlowUpChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlowUpChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlowUpChatRecordData({
  DocumentReference? glowUpSendUser,
  DateTime? glowUpSendTime,
  String? glowUpLastMessage,
  int? glowUpUnreadMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Glow_Up_SendUser': glowUpSendUser,
      'Glow_Up_SendTime': glowUpSendTime,
      'Glow_Up_LastMessage': glowUpLastMessage,
      'Glow_Up_UnreadMessage': glowUpUnreadMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlowUpChatRecordDocumentEquality implements Equality<GlowUpChatRecord> {
  const GlowUpChatRecordDocumentEquality();

  @override
  bool equals(GlowUpChatRecord? e1, GlowUpChatRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.glowUpChatUsers, e2?.glowUpChatUsers) &&
        e1?.glowUpSendUser == e2?.glowUpSendUser &&
        e1?.glowUpSendTime == e2?.glowUpSendTime &&
        e1?.glowUpLastMessage == e2?.glowUpLastMessage &&
        e1?.glowUpUnreadMessage == e2?.glowUpUnreadMessage;
  }

  @override
  int hash(GlowUpChatRecord? e) => const ListEquality().hash([
        e?.glowUpChatUsers,
        e?.glowUpSendUser,
        e?.glowUpSendTime,
        e?.glowUpLastMessage,
        e?.glowUpUnreadMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is GlowUpChatRecord;
}

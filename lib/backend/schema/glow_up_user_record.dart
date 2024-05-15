import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlowUpUserRecord extends FirestoreRecord {
  GlowUpUserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Glow_Up_Discribe" field.
  String? _glowUpDiscribe;
  String get glowUpDiscribe => _glowUpDiscribe ?? '';
  bool hasGlowUpDiscribe() => _glowUpDiscribe != null;

  // "Glow_Up_FavoPosts" field.
  List<DocumentReference>? _glowUpFavoPosts;
  List<DocumentReference> get glowUpFavoPosts => _glowUpFavoPosts ?? const [];
  bool hasGlowUpFavoPosts() => _glowUpFavoPosts != null;

  // "Glow_Up_IsOnline" field.
  bool? _glowUpIsOnline;
  bool get glowUpIsOnline => _glowUpIsOnline ?? false;
  bool hasGlowUpIsOnline() => _glowUpIsOnline != null;

  // "Glow_Up_InChatRoom" field.
  DocumentReference? _glowUpInChatRoom;
  DocumentReference? get glowUpInChatRoom => _glowUpInChatRoom;
  bool hasGlowUpInChatRoom() => _glowUpInChatRoom != null;

  // "Glow_Up_BlockList" field.
  List<DocumentReference>? _glowUpBlockList;
  List<DocumentReference> get glowUpBlockList => _glowUpBlockList ?? const [];
  bool hasGlowUpBlockList() => _glowUpBlockList != null;

  // "Glow_Up_FavoRecommend" field.
  List<String>? _glowUpFavoRecommend;
  List<String> get glowUpFavoRecommend => _glowUpFavoRecommend ?? const [];
  bool hasGlowUpFavoRecommend() => _glowUpFavoRecommend != null;

  // "Glow_Up_FollowList" field.
  List<DocumentReference>? _glowUpFollowList;
  List<DocumentReference> get glowUpFollowList => _glowUpFollowList ?? const [];
  bool hasGlowUpFollowList() => _glowUpFollowList != null;

  // "Glow_Up_Wallet" field.
  int? _glowUpWallet;
  int get glowUpWallet => _glowUpWallet ?? 0;
  bool hasGlowUpWallet() => _glowUpWallet != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _glowUpDiscribe = snapshotData['Glow_Up_Discribe'] as String?;
    _glowUpFavoPosts = getDataList(snapshotData['Glow_Up_FavoPosts']);
    _glowUpIsOnline = snapshotData['Glow_Up_IsOnline'] as bool?;
    _glowUpInChatRoom =
        snapshotData['Glow_Up_InChatRoom'] as DocumentReference?;
    _glowUpBlockList = getDataList(snapshotData['Glow_Up_BlockList']);
    _glowUpFavoRecommend = getDataList(snapshotData['Glow_Up_FavoRecommend']);
    _glowUpFollowList = getDataList(snapshotData['Glow_Up_FollowList']);
    _glowUpWallet = castToType<int>(snapshotData['Glow_Up_Wallet']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Glow_Up_User');

  static Stream<GlowUpUserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlowUpUserRecord.fromSnapshot(s));

  static Future<GlowUpUserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GlowUpUserRecord.fromSnapshot(s));

  static GlowUpUserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlowUpUserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlowUpUserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlowUpUserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlowUpUserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlowUpUserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlowUpUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? glowUpDiscribe,
  bool? glowUpIsOnline,
  DocumentReference? glowUpInChatRoom,
  int? glowUpWallet,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Glow_Up_Discribe': glowUpDiscribe,
      'Glow_Up_IsOnline': glowUpIsOnline,
      'Glow_Up_InChatRoom': glowUpInChatRoom,
      'Glow_Up_Wallet': glowUpWallet,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlowUpUserRecordDocumentEquality implements Equality<GlowUpUserRecord> {
  const GlowUpUserRecordDocumentEquality();

  @override
  bool equals(GlowUpUserRecord? e1, GlowUpUserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.glowUpDiscribe == e2?.glowUpDiscribe &&
        listEquality.equals(e1?.glowUpFavoPosts, e2?.glowUpFavoPosts) &&
        e1?.glowUpIsOnline == e2?.glowUpIsOnline &&
        e1?.glowUpInChatRoom == e2?.glowUpInChatRoom &&
        listEquality.equals(e1?.glowUpBlockList, e2?.glowUpBlockList) &&
        listEquality.equals(e1?.glowUpFavoRecommend, e2?.glowUpFavoRecommend) &&
        listEquality.equals(e1?.glowUpFollowList, e2?.glowUpFollowList) &&
        e1?.glowUpWallet == e2?.glowUpWallet;
  }

  @override
  int hash(GlowUpUserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.glowUpDiscribe,
        e?.glowUpFavoPosts,
        e?.glowUpIsOnline,
        e?.glowUpInChatRoom,
        e?.glowUpBlockList,
        e?.glowUpFavoRecommend,
        e?.glowUpFollowList,
        e?.glowUpWallet
      ]);

  @override
  bool isValidKey(Object? o) => o is GlowUpUserRecord;
}

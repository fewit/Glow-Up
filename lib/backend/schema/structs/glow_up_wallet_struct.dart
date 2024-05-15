// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlowUpWalletStruct extends FFFirebaseStruct {
  GlowUpWalletStruct({
    int? glowUpWalletCont,
    double? glowUpWalletMoney,
    String? glowUpWalletKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _glowUpWalletCont = glowUpWalletCont,
        _glowUpWalletMoney = glowUpWalletMoney,
        _glowUpWalletKey = glowUpWalletKey,
        super(firestoreUtilData);

  // "Glow_Up_WalletCont" field.
  int? _glowUpWalletCont;
  int get glowUpWalletCont => _glowUpWalletCont ?? 0;
  set glowUpWalletCont(int? val) => _glowUpWalletCont = val;
  void incrementGlowUpWalletCont(int amount) =>
      _glowUpWalletCont = glowUpWalletCont + amount;
  bool hasGlowUpWalletCont() => _glowUpWalletCont != null;

  // "Glow_Up_WalletMoney" field.
  double? _glowUpWalletMoney;
  double get glowUpWalletMoney => _glowUpWalletMoney ?? 0.0;
  set glowUpWalletMoney(double? val) => _glowUpWalletMoney = val;
  void incrementGlowUpWalletMoney(double amount) =>
      _glowUpWalletMoney = glowUpWalletMoney + amount;
  bool hasGlowUpWalletMoney() => _glowUpWalletMoney != null;

  // "Glow_Up_WalletKey" field.
  String? _glowUpWalletKey;
  String get glowUpWalletKey => _glowUpWalletKey ?? '';
  set glowUpWalletKey(String? val) => _glowUpWalletKey = val;
  bool hasGlowUpWalletKey() => _glowUpWalletKey != null;

  static GlowUpWalletStruct fromMap(Map<String, dynamic> data) =>
      GlowUpWalletStruct(
        glowUpWalletCont: castToType<int>(data['Glow_Up_WalletCont']),
        glowUpWalletMoney: castToType<double>(data['Glow_Up_WalletMoney']),
        glowUpWalletKey: data['Glow_Up_WalletKey'] as String?,
      );

  static GlowUpWalletStruct? maybeFromMap(dynamic data) => data is Map
      ? GlowUpWalletStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Glow_Up_WalletCont': _glowUpWalletCont,
        'Glow_Up_WalletMoney': _glowUpWalletMoney,
        'Glow_Up_WalletKey': _glowUpWalletKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Glow_Up_WalletCont': serializeParam(
          _glowUpWalletCont,
          ParamType.int,
        ),
        'Glow_Up_WalletMoney': serializeParam(
          _glowUpWalletMoney,
          ParamType.double,
        ),
        'Glow_Up_WalletKey': serializeParam(
          _glowUpWalletKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static GlowUpWalletStruct fromSerializableMap(Map<String, dynamic> data) =>
      GlowUpWalletStruct(
        glowUpWalletCont: deserializeParam(
          data['Glow_Up_WalletCont'],
          ParamType.int,
          false,
        ),
        glowUpWalletMoney: deserializeParam(
          data['Glow_Up_WalletMoney'],
          ParamType.double,
          false,
        ),
        glowUpWalletKey: deserializeParam(
          data['Glow_Up_WalletKey'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GlowUpWalletStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GlowUpWalletStruct &&
        glowUpWalletCont == other.glowUpWalletCont &&
        glowUpWalletMoney == other.glowUpWalletMoney &&
        glowUpWalletKey == other.glowUpWalletKey;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([glowUpWalletCont, glowUpWalletMoney, glowUpWalletKey]);
}

GlowUpWalletStruct createGlowUpWalletStruct({
  int? glowUpWalletCont,
  double? glowUpWalletMoney,
  String? glowUpWalletKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GlowUpWalletStruct(
      glowUpWalletCont: glowUpWalletCont,
      glowUpWalletMoney: glowUpWalletMoney,
      glowUpWalletKey: glowUpWalletKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GlowUpWalletStruct? updateGlowUpWalletStruct(
  GlowUpWalletStruct? glowUpWallet, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    glowUpWallet
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGlowUpWalletStructData(
  Map<String, dynamic> firestoreData,
  GlowUpWalletStruct? glowUpWallet,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (glowUpWallet == null) {
    return;
  }
  if (glowUpWallet.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && glowUpWallet.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final glowUpWalletData =
      getGlowUpWalletFirestoreData(glowUpWallet, forFieldValue);
  final nestedData =
      glowUpWalletData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = glowUpWallet.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGlowUpWalletFirestoreData(
  GlowUpWalletStruct? glowUpWallet, [
  bool forFieldValue = false,
]) {
  if (glowUpWallet == null) {
    return {};
  }
  final firestoreData = mapToFirestore(glowUpWallet.toMap());

  // Add any Firestore field values
  glowUpWallet.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGlowUpWalletListFirestoreData(
  List<GlowUpWalletStruct>? glowUpWallets,
) =>
    glowUpWallets?.map((e) => getGlowUpWalletFirestoreData(e, true)).toList() ??
    [];

// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlowUpGiftTypeStruct extends FFFirebaseStruct {
  GlowUpGiftTypeStruct({
    int? glowUpGiftPrice,
    int? glowUpGiftAddHot,
    String? glowUpGiftImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _glowUpGiftPrice = glowUpGiftPrice,
        _glowUpGiftAddHot = glowUpGiftAddHot,
        _glowUpGiftImage = glowUpGiftImage,
        super(firestoreUtilData);

  // "Glow_Up_GiftPrice" field.
  int? _glowUpGiftPrice;
  int get glowUpGiftPrice => _glowUpGiftPrice ?? 0;
  set glowUpGiftPrice(int? val) => _glowUpGiftPrice = val;
  void incrementGlowUpGiftPrice(int amount) =>
      _glowUpGiftPrice = glowUpGiftPrice + amount;
  bool hasGlowUpGiftPrice() => _glowUpGiftPrice != null;

  // "Glow_Up_GiftAddHot" field.
  int? _glowUpGiftAddHot;
  int get glowUpGiftAddHot => _glowUpGiftAddHot ?? 0;
  set glowUpGiftAddHot(int? val) => _glowUpGiftAddHot = val;
  void incrementGlowUpGiftAddHot(int amount) =>
      _glowUpGiftAddHot = glowUpGiftAddHot + amount;
  bool hasGlowUpGiftAddHot() => _glowUpGiftAddHot != null;

  // "Glow_Up_GiftImage" field.
  String? _glowUpGiftImage;
  String get glowUpGiftImage => _glowUpGiftImage ?? '';
  set glowUpGiftImage(String? val) => _glowUpGiftImage = val;
  bool hasGlowUpGiftImage() => _glowUpGiftImage != null;

  static GlowUpGiftTypeStruct fromMap(Map<String, dynamic> data) =>
      GlowUpGiftTypeStruct(
        glowUpGiftPrice: castToType<int>(data['Glow_Up_GiftPrice']),
        glowUpGiftAddHot: castToType<int>(data['Glow_Up_GiftAddHot']),
        glowUpGiftImage: data['Glow_Up_GiftImage'] as String?,
      );

  static GlowUpGiftTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? GlowUpGiftTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Glow_Up_GiftPrice': _glowUpGiftPrice,
        'Glow_Up_GiftAddHot': _glowUpGiftAddHot,
        'Glow_Up_GiftImage': _glowUpGiftImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Glow_Up_GiftPrice': serializeParam(
          _glowUpGiftPrice,
          ParamType.int,
        ),
        'Glow_Up_GiftAddHot': serializeParam(
          _glowUpGiftAddHot,
          ParamType.int,
        ),
        'Glow_Up_GiftImage': serializeParam(
          _glowUpGiftImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static GlowUpGiftTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      GlowUpGiftTypeStruct(
        glowUpGiftPrice: deserializeParam(
          data['Glow_Up_GiftPrice'],
          ParamType.int,
          false,
        ),
        glowUpGiftAddHot: deserializeParam(
          data['Glow_Up_GiftAddHot'],
          ParamType.int,
          false,
        ),
        glowUpGiftImage: deserializeParam(
          data['Glow_Up_GiftImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GlowUpGiftTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GlowUpGiftTypeStruct &&
        glowUpGiftPrice == other.glowUpGiftPrice &&
        glowUpGiftAddHot == other.glowUpGiftAddHot &&
        glowUpGiftImage == other.glowUpGiftImage;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([glowUpGiftPrice, glowUpGiftAddHot, glowUpGiftImage]);
}

GlowUpGiftTypeStruct createGlowUpGiftTypeStruct({
  int? glowUpGiftPrice,
  int? glowUpGiftAddHot,
  String? glowUpGiftImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GlowUpGiftTypeStruct(
      glowUpGiftPrice: glowUpGiftPrice,
      glowUpGiftAddHot: glowUpGiftAddHot,
      glowUpGiftImage: glowUpGiftImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GlowUpGiftTypeStruct? updateGlowUpGiftTypeStruct(
  GlowUpGiftTypeStruct? glowUpGiftType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    glowUpGiftType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGlowUpGiftTypeStructData(
  Map<String, dynamic> firestoreData,
  GlowUpGiftTypeStruct? glowUpGiftType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (glowUpGiftType == null) {
    return;
  }
  if (glowUpGiftType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && glowUpGiftType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final glowUpGiftTypeData =
      getGlowUpGiftTypeFirestoreData(glowUpGiftType, forFieldValue);
  final nestedData =
      glowUpGiftTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = glowUpGiftType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGlowUpGiftTypeFirestoreData(
  GlowUpGiftTypeStruct? glowUpGiftType, [
  bool forFieldValue = false,
]) {
  if (glowUpGiftType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(glowUpGiftType.toMap());

  // Add any Firestore field values
  glowUpGiftType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGlowUpGiftTypeListFirestoreData(
  List<GlowUpGiftTypeStruct>? glowUpGiftTypes,
) =>
    glowUpGiftTypes
        ?.map((e) => getGlowUpGiftTypeFirestoreData(e, true))
        .toList() ??
    [];

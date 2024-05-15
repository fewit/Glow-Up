// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlowUpRecommendStruct extends FFFirebaseStruct {
  GlowUpRecommendStruct({
    String? glowUpRecommendName,
    double? glowUpRecommendScore,
    String? glowUpRecommendContent,
    String? glowUpRecommentImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _glowUpRecommendName = glowUpRecommendName,
        _glowUpRecommendScore = glowUpRecommendScore,
        _glowUpRecommendContent = glowUpRecommendContent,
        _glowUpRecommentImage = glowUpRecommentImage,
        super(firestoreUtilData);

  // "Glow_Up_RecommendName" field.
  String? _glowUpRecommendName;
  String get glowUpRecommendName => _glowUpRecommendName ?? '';
  set glowUpRecommendName(String? val) => _glowUpRecommendName = val;
  bool hasGlowUpRecommendName() => _glowUpRecommendName != null;

  // "Glow_Up_RecommendScore" field.
  double? _glowUpRecommendScore;
  double get glowUpRecommendScore => _glowUpRecommendScore ?? 0.0;
  set glowUpRecommendScore(double? val) => _glowUpRecommendScore = val;
  void incrementGlowUpRecommendScore(double amount) =>
      _glowUpRecommendScore = glowUpRecommendScore + amount;
  bool hasGlowUpRecommendScore() => _glowUpRecommendScore != null;

  // "Glow_Up_RecommendContent" field.
  String? _glowUpRecommendContent;
  String get glowUpRecommendContent => _glowUpRecommendContent ?? '';
  set glowUpRecommendContent(String? val) => _glowUpRecommendContent = val;
  bool hasGlowUpRecommendContent() => _glowUpRecommendContent != null;

  // "Glow_Up_RecommentImage" field.
  String? _glowUpRecommentImage;
  String get glowUpRecommentImage => _glowUpRecommentImage ?? '';
  set glowUpRecommentImage(String? val) => _glowUpRecommentImage = val;
  bool hasGlowUpRecommentImage() => _glowUpRecommentImage != null;

  static GlowUpRecommendStruct fromMap(Map<String, dynamic> data) =>
      GlowUpRecommendStruct(
        glowUpRecommendName: data['Glow_Up_RecommendName'] as String?,
        glowUpRecommendScore:
            castToType<double>(data['Glow_Up_RecommendScore']),
        glowUpRecommendContent: data['Glow_Up_RecommendContent'] as String?,
        glowUpRecommentImage: data['Glow_Up_RecommentImage'] as String?,
      );

  static GlowUpRecommendStruct? maybeFromMap(dynamic data) => data is Map
      ? GlowUpRecommendStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Glow_Up_RecommendName': _glowUpRecommendName,
        'Glow_Up_RecommendScore': _glowUpRecommendScore,
        'Glow_Up_RecommendContent': _glowUpRecommendContent,
        'Glow_Up_RecommentImage': _glowUpRecommentImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Glow_Up_RecommendName': serializeParam(
          _glowUpRecommendName,
          ParamType.String,
        ),
        'Glow_Up_RecommendScore': serializeParam(
          _glowUpRecommendScore,
          ParamType.double,
        ),
        'Glow_Up_RecommendContent': serializeParam(
          _glowUpRecommendContent,
          ParamType.String,
        ),
        'Glow_Up_RecommentImage': serializeParam(
          _glowUpRecommentImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static GlowUpRecommendStruct fromSerializableMap(Map<String, dynamic> data) =>
      GlowUpRecommendStruct(
        glowUpRecommendName: deserializeParam(
          data['Glow_Up_RecommendName'],
          ParamType.String,
          false,
        ),
        glowUpRecommendScore: deserializeParam(
          data['Glow_Up_RecommendScore'],
          ParamType.double,
          false,
        ),
        glowUpRecommendContent: deserializeParam(
          data['Glow_Up_RecommendContent'],
          ParamType.String,
          false,
        ),
        glowUpRecommentImage: deserializeParam(
          data['Glow_Up_RecommentImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GlowUpRecommendStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GlowUpRecommendStruct &&
        glowUpRecommendName == other.glowUpRecommendName &&
        glowUpRecommendScore == other.glowUpRecommendScore &&
        glowUpRecommendContent == other.glowUpRecommendContent &&
        glowUpRecommentImage == other.glowUpRecommentImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        glowUpRecommendName,
        glowUpRecommendScore,
        glowUpRecommendContent,
        glowUpRecommentImage
      ]);
}

GlowUpRecommendStruct createGlowUpRecommendStruct({
  String? glowUpRecommendName,
  double? glowUpRecommendScore,
  String? glowUpRecommendContent,
  String? glowUpRecommentImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GlowUpRecommendStruct(
      glowUpRecommendName: glowUpRecommendName,
      glowUpRecommendScore: glowUpRecommendScore,
      glowUpRecommendContent: glowUpRecommendContent,
      glowUpRecommentImage: glowUpRecommentImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GlowUpRecommendStruct? updateGlowUpRecommendStruct(
  GlowUpRecommendStruct? glowUpRecommend, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    glowUpRecommend
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGlowUpRecommendStructData(
  Map<String, dynamic> firestoreData,
  GlowUpRecommendStruct? glowUpRecommend,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (glowUpRecommend == null) {
    return;
  }
  if (glowUpRecommend.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && glowUpRecommend.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final glowUpRecommendData =
      getGlowUpRecommendFirestoreData(glowUpRecommend, forFieldValue);
  final nestedData =
      glowUpRecommendData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = glowUpRecommend.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGlowUpRecommendFirestoreData(
  GlowUpRecommendStruct? glowUpRecommend, [
  bool forFieldValue = false,
]) {
  if (glowUpRecommend == null) {
    return {};
  }
  final firestoreData = mapToFirestore(glowUpRecommend.toMap());

  // Add any Firestore field values
  glowUpRecommend.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGlowUpRecommendListFirestoreData(
  List<GlowUpRecommendStruct>? glowUpRecommends,
) =>
    glowUpRecommends
        ?.map((e) => getGlowUpRecommendFirestoreData(e, true))
        .toList() ??
    [];

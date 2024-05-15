// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlowUpReportsStruct extends FFFirebaseStruct {
  GlowUpReportsStruct({
    DateTime? glowUpReportTime,
    String? glowUpReportContent,
    GlowUpReportType? glowUpReportType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _glowUpReportTime = glowUpReportTime,
        _glowUpReportContent = glowUpReportContent,
        _glowUpReportType = glowUpReportType,
        super(firestoreUtilData);

  // "Glow_Up_ReportTime" field.
  DateTime? _glowUpReportTime;
  DateTime? get glowUpReportTime => _glowUpReportTime;
  set glowUpReportTime(DateTime? val) => _glowUpReportTime = val;
  bool hasGlowUpReportTime() => _glowUpReportTime != null;

  // "Glow_Up_ReportContent" field.
  String? _glowUpReportContent;
  String get glowUpReportContent => _glowUpReportContent ?? '';
  set glowUpReportContent(String? val) => _glowUpReportContent = val;
  bool hasGlowUpReportContent() => _glowUpReportContent != null;

  // "Glow_Up_ReportType" field.
  GlowUpReportType? _glowUpReportType;
  GlowUpReportType get glowUpReportType =>
      _glowUpReportType ?? GlowUpReportType.Politicalsensitivity;
  set glowUpReportType(GlowUpReportType? val) => _glowUpReportType = val;
  bool hasGlowUpReportType() => _glowUpReportType != null;

  static GlowUpReportsStruct fromMap(Map<String, dynamic> data) =>
      GlowUpReportsStruct(
        glowUpReportTime: data['Glow_Up_ReportTime'] as DateTime?,
        glowUpReportContent: data['Glow_Up_ReportContent'] as String?,
        glowUpReportType:
            deserializeEnum<GlowUpReportType>(data['Glow_Up_ReportType']),
      );

  static GlowUpReportsStruct? maybeFromMap(dynamic data) => data is Map
      ? GlowUpReportsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Glow_Up_ReportTime': _glowUpReportTime,
        'Glow_Up_ReportContent': _glowUpReportContent,
        'Glow_Up_ReportType': _glowUpReportType?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Glow_Up_ReportTime': serializeParam(
          _glowUpReportTime,
          ParamType.DateTime,
        ),
        'Glow_Up_ReportContent': serializeParam(
          _glowUpReportContent,
          ParamType.String,
        ),
        'Glow_Up_ReportType': serializeParam(
          _glowUpReportType,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static GlowUpReportsStruct fromSerializableMap(Map<String, dynamic> data) =>
      GlowUpReportsStruct(
        glowUpReportTime: deserializeParam(
          data['Glow_Up_ReportTime'],
          ParamType.DateTime,
          false,
        ),
        glowUpReportContent: deserializeParam(
          data['Glow_Up_ReportContent'],
          ParamType.String,
          false,
        ),
        glowUpReportType: deserializeParam<GlowUpReportType>(
          data['Glow_Up_ReportType'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'GlowUpReportsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GlowUpReportsStruct &&
        glowUpReportTime == other.glowUpReportTime &&
        glowUpReportContent == other.glowUpReportContent &&
        glowUpReportType == other.glowUpReportType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([glowUpReportTime, glowUpReportContent, glowUpReportType]);
}

GlowUpReportsStruct createGlowUpReportsStruct({
  DateTime? glowUpReportTime,
  String? glowUpReportContent,
  GlowUpReportType? glowUpReportType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GlowUpReportsStruct(
      glowUpReportTime: glowUpReportTime,
      glowUpReportContent: glowUpReportContent,
      glowUpReportType: glowUpReportType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GlowUpReportsStruct? updateGlowUpReportsStruct(
  GlowUpReportsStruct? glowUpReports, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    glowUpReports
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGlowUpReportsStructData(
  Map<String, dynamic> firestoreData,
  GlowUpReportsStruct? glowUpReports,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (glowUpReports == null) {
    return;
  }
  if (glowUpReports.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && glowUpReports.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final glowUpReportsData =
      getGlowUpReportsFirestoreData(glowUpReports, forFieldValue);
  final nestedData =
      glowUpReportsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = glowUpReports.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGlowUpReportsFirestoreData(
  GlowUpReportsStruct? glowUpReports, [
  bool forFieldValue = false,
]) {
  if (glowUpReports == null) {
    return {};
  }
  final firestoreData = mapToFirestore(glowUpReports.toMap());

  // Add any Firestore field values
  glowUpReports.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGlowUpReportsListFirestoreData(
  List<GlowUpReportsStruct>? glowUpReportss,
) =>
    glowUpReportss
        ?.map((e) => getGlowUpReportsFirestoreData(e, true))
        .toList() ??
    [];

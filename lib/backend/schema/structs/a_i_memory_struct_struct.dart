// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Память AI
class AIMemoryStructStruct extends FFFirebaseStruct {
  AIMemoryStructStruct({
    String? vectorId,
    String? summary,
    DateTime? createdAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vectorId = vectorId,
        _summary = summary,
        _createdAt = createdAt,
        super(firestoreUtilData);

  // "vectorId" field.
  String? _vectorId;
  String get vectorId => _vectorId ?? '';
  set vectorId(String? val) => _vectorId = val;

  bool hasVectorId() => _vectorId != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  set summary(String? val) => _summary = val;

  bool hasSummary() => _summary != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static AIMemoryStructStruct fromMap(Map<String, dynamic> data) =>
      AIMemoryStructStruct(
        vectorId: data['vectorId'] as String?,
        summary: data['summary'] as String?,
        createdAt: data['createdAt'] as DateTime?,
      );

  static AIMemoryStructStruct? maybeFromMap(dynamic data) => data is Map
      ? AIMemoryStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vectorId': _vectorId,
        'summary': _summary,
        'createdAt': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vectorId': serializeParam(
          _vectorId,
          ParamType.String,
        ),
        'summary': serializeParam(
          _summary,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AIMemoryStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      AIMemoryStructStruct(
        vectorId: deserializeParam(
          data['vectorId'],
          ParamType.String,
          false,
        ),
        summary: deserializeParam(
          data['summary'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AIMemoryStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AIMemoryStructStruct &&
        vectorId == other.vectorId &&
        summary == other.summary &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([vectorId, summary, createdAt]);
}

AIMemoryStructStruct createAIMemoryStructStruct({
  String? vectorId,
  String? summary,
  DateTime? createdAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AIMemoryStructStruct(
      vectorId: vectorId,
      summary: summary,
      createdAt: createdAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AIMemoryStructStruct? updateAIMemoryStructStruct(
  AIMemoryStructStruct? aIMemoryStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aIMemoryStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAIMemoryStructStructData(
  Map<String, dynamic> firestoreData,
  AIMemoryStructStruct? aIMemoryStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aIMemoryStruct == null) {
    return;
  }
  if (aIMemoryStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aIMemoryStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aIMemoryStructData =
      getAIMemoryStructFirestoreData(aIMemoryStruct, forFieldValue);
  final nestedData =
      aIMemoryStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aIMemoryStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAIMemoryStructFirestoreData(
  AIMemoryStructStruct? aIMemoryStruct, [
  bool forFieldValue = false,
]) {
  if (aIMemoryStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aIMemoryStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(aIMemoryStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAIMemoryStructListFirestoreData(
  List<AIMemoryStructStruct>? aIMemoryStructs,
) =>
    aIMemoryStructs
        ?.map((e) => getAIMemoryStructFirestoreData(e, true))
        .toList() ??
    [];

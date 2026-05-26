// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Жизненные события
class LifeEventStructStruct extends FFFirebaseStruct {
  LifeEventStructStruct({
    String? type,
    String? title,
    DateTime? timestamp,
    double? importanceScore,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _title = title,
        _timestamp = timestamp,
        _importanceScore = importanceScore,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "importanceScore" field.
  double? _importanceScore;
  double get importanceScore => _importanceScore ?? 0.0;
  set importanceScore(double? val) => _importanceScore = val;

  void incrementImportanceScore(double amount) =>
      importanceScore = importanceScore + amount;

  bool hasImportanceScore() => _importanceScore != null;

  static LifeEventStructStruct fromMap(Map<String, dynamic> data) =>
      LifeEventStructStruct(
        type: data['type'] as String?,
        title: data['title'] as String?,
        timestamp: data['timestamp'] as DateTime?,
        importanceScore: castToType<double>(data['importanceScore']),
      );

  static LifeEventStructStruct? maybeFromMap(dynamic data) => data is Map
      ? LifeEventStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'title': _title,
        'timestamp': _timestamp,
        'importanceScore': _importanceScore,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'importanceScore': serializeParam(
          _importanceScore,
          ParamType.double,
        ),
      }.withoutNulls;

  static LifeEventStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      LifeEventStructStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        importanceScore: deserializeParam(
          data['importanceScore'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'LifeEventStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LifeEventStructStruct &&
        type == other.type &&
        title == other.title &&
        timestamp == other.timestamp &&
        importanceScore == other.importanceScore;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, title, timestamp, importanceScore]);
}

LifeEventStructStruct createLifeEventStructStruct({
  String? type,
  String? title,
  DateTime? timestamp,
  double? importanceScore,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LifeEventStructStruct(
      type: type,
      title: title,
      timestamp: timestamp,
      importanceScore: importanceScore,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LifeEventStructStruct? updateLifeEventStructStruct(
  LifeEventStructStruct? lifeEventStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lifeEventStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLifeEventStructStructData(
  Map<String, dynamic> firestoreData,
  LifeEventStructStruct? lifeEventStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lifeEventStruct == null) {
    return;
  }
  if (lifeEventStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lifeEventStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lifeEventStructData =
      getLifeEventStructFirestoreData(lifeEventStruct, forFieldValue);
  final nestedData =
      lifeEventStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lifeEventStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLifeEventStructFirestoreData(
  LifeEventStructStruct? lifeEventStruct, [
  bool forFieldValue = false,
]) {
  if (lifeEventStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lifeEventStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(lifeEventStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLifeEventStructListFirestoreData(
  List<LifeEventStructStruct>? lifeEventStructs,
) =>
    lifeEventStructs
        ?.map((e) => getLifeEventStructFirestoreData(e, true))
        .toList() ??
    [];

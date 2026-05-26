// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Сессии AI
class AISessionStructStruct extends FFFirebaseStruct {
  AISessionStructStruct({
    String? id,
    String? mode,
    DateTime? startedAt,
    DateTime? endedAt,
    String? contextSummary,
    int? tokenUsage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _mode = mode,
        _startedAt = startedAt,
        _endedAt = endedAt,
        _contextSummary = contextSummary,
        _tokenUsage = tokenUsage,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  set mode(String? val) => _mode = val;

  bool hasMode() => _mode != null;

  // "startedAt" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  set startedAt(DateTime? val) => _startedAt = val;

  bool hasStartedAt() => _startedAt != null;

  // "endedAt" field.
  DateTime? _endedAt;
  DateTime? get endedAt => _endedAt;
  set endedAt(DateTime? val) => _endedAt = val;

  bool hasEndedAt() => _endedAt != null;

  // "contextSummary" field.
  String? _contextSummary;
  String get contextSummary => _contextSummary ?? '';
  set contextSummary(String? val) => _contextSummary = val;

  bool hasContextSummary() => _contextSummary != null;

  // "tokenUsage" field.
  int? _tokenUsage;
  int get tokenUsage => _tokenUsage ?? 0;
  set tokenUsage(int? val) => _tokenUsage = val;

  void incrementTokenUsage(int amount) => tokenUsage = tokenUsage + amount;

  bool hasTokenUsage() => _tokenUsage != null;

  static AISessionStructStruct fromMap(Map<String, dynamic> data) =>
      AISessionStructStruct(
        id: data['id'] as String?,
        mode: data['mode'] as String?,
        startedAt: data['startedAt'] as DateTime?,
        endedAt: data['endedAt'] as DateTime?,
        contextSummary: data['contextSummary'] as String?,
        tokenUsage: castToType<int>(data['tokenUsage']),
      );

  static AISessionStructStruct? maybeFromMap(dynamic data) => data is Map
      ? AISessionStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'mode': _mode,
        'startedAt': _startedAt,
        'endedAt': _endedAt,
        'contextSummary': _contextSummary,
        'tokenUsage': _tokenUsage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'mode': serializeParam(
          _mode,
          ParamType.String,
        ),
        'startedAt': serializeParam(
          _startedAt,
          ParamType.DateTime,
        ),
        'endedAt': serializeParam(
          _endedAt,
          ParamType.DateTime,
        ),
        'contextSummary': serializeParam(
          _contextSummary,
          ParamType.String,
        ),
        'tokenUsage': serializeParam(
          _tokenUsage,
          ParamType.int,
        ),
      }.withoutNulls;

  static AISessionStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      AISessionStructStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        mode: deserializeParam(
          data['mode'],
          ParamType.String,
          false,
        ),
        startedAt: deserializeParam(
          data['startedAt'],
          ParamType.DateTime,
          false,
        ),
        endedAt: deserializeParam(
          data['endedAt'],
          ParamType.DateTime,
          false,
        ),
        contextSummary: deserializeParam(
          data['contextSummary'],
          ParamType.String,
          false,
        ),
        tokenUsage: deserializeParam(
          data['tokenUsage'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AISessionStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AISessionStructStruct &&
        id == other.id &&
        mode == other.mode &&
        startedAt == other.startedAt &&
        endedAt == other.endedAt &&
        contextSummary == other.contextSummary &&
        tokenUsage == other.tokenUsage;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, mode, startedAt, endedAt, contextSummary, tokenUsage]);
}

AISessionStructStruct createAISessionStructStruct({
  String? id,
  String? mode,
  DateTime? startedAt,
  DateTime? endedAt,
  String? contextSummary,
  int? tokenUsage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AISessionStructStruct(
      id: id,
      mode: mode,
      startedAt: startedAt,
      endedAt: endedAt,
      contextSummary: contextSummary,
      tokenUsage: tokenUsage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AISessionStructStruct? updateAISessionStructStruct(
  AISessionStructStruct? aISessionStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aISessionStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAISessionStructStructData(
  Map<String, dynamic> firestoreData,
  AISessionStructStruct? aISessionStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aISessionStruct == null) {
    return;
  }
  if (aISessionStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aISessionStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aISessionStructData =
      getAISessionStructFirestoreData(aISessionStruct, forFieldValue);
  final nestedData =
      aISessionStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aISessionStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAISessionStructFirestoreData(
  AISessionStructStruct? aISessionStruct, [
  bool forFieldValue = false,
]) {
  if (aISessionStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aISessionStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(aISessionStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAISessionStructListFirestoreData(
  List<AISessionStructStruct>? aISessionStructs,
) =>
    aISessionStructs
        ?.map((e) => getAISessionStructFirestoreData(e, true))
        .toList() ??
    [];

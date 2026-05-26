// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Звонки
class CallStructStruct extends FFFirebaseStruct {
  CallStructStruct({
    String? id,
    DateTime? startedAt,
    int? durationSec,
    double? moodScore,
    String? summary,
    String? transcriptUrl,
    String? audioUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _startedAt = startedAt,
        _durationSec = durationSec,
        _moodScore = moodScore,
        _summary = summary,
        _transcriptUrl = transcriptUrl,
        _audioUrl = audioUrl,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "startedAt" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  set startedAt(DateTime? val) => _startedAt = val;

  bool hasStartedAt() => _startedAt != null;

  // "durationSec" field.
  int? _durationSec;
  int get durationSec => _durationSec ?? 0;
  set durationSec(int? val) => _durationSec = val;

  void incrementDurationSec(int amount) => durationSec = durationSec + amount;

  bool hasDurationSec() => _durationSec != null;

  // "moodScore" field.
  double? _moodScore;
  double get moodScore => _moodScore ?? 0.0;
  set moodScore(double? val) => _moodScore = val;

  void incrementMoodScore(double amount) => moodScore = moodScore + amount;

  bool hasMoodScore() => _moodScore != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  set summary(String? val) => _summary = val;

  bool hasSummary() => _summary != null;

  // "transcriptUrl" field.
  String? _transcriptUrl;
  String get transcriptUrl => _transcriptUrl ?? '';
  set transcriptUrl(String? val) => _transcriptUrl = val;

  bool hasTranscriptUrl() => _transcriptUrl != null;

  // "audioUrl" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  set audioUrl(String? val) => _audioUrl = val;

  bool hasAudioUrl() => _audioUrl != null;

  static CallStructStruct fromMap(Map<String, dynamic> data) =>
      CallStructStruct(
        id: data['id'] as String?,
        startedAt: data['startedAt'] as DateTime?,
        durationSec: castToType<int>(data['durationSec']),
        moodScore: castToType<double>(data['moodScore']),
        summary: data['summary'] as String?,
        transcriptUrl: data['transcriptUrl'] as String?,
        audioUrl: data['audioUrl'] as String?,
      );

  static CallStructStruct? maybeFromMap(dynamic data) => data is Map
      ? CallStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'startedAt': _startedAt,
        'durationSec': _durationSec,
        'moodScore': _moodScore,
        'summary': _summary,
        'transcriptUrl': _transcriptUrl,
        'audioUrl': _audioUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'startedAt': serializeParam(
          _startedAt,
          ParamType.DateTime,
        ),
        'durationSec': serializeParam(
          _durationSec,
          ParamType.int,
        ),
        'moodScore': serializeParam(
          _moodScore,
          ParamType.double,
        ),
        'summary': serializeParam(
          _summary,
          ParamType.String,
        ),
        'transcriptUrl': serializeParam(
          _transcriptUrl,
          ParamType.String,
        ),
        'audioUrl': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static CallStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      CallStructStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        startedAt: deserializeParam(
          data['startedAt'],
          ParamType.DateTime,
          false,
        ),
        durationSec: deserializeParam(
          data['durationSec'],
          ParamType.int,
          false,
        ),
        moodScore: deserializeParam(
          data['moodScore'],
          ParamType.double,
          false,
        ),
        summary: deserializeParam(
          data['summary'],
          ParamType.String,
          false,
        ),
        transcriptUrl: deserializeParam(
          data['transcriptUrl'],
          ParamType.String,
          false,
        ),
        audioUrl: deserializeParam(
          data['audioUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CallStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CallStructStruct &&
        id == other.id &&
        startedAt == other.startedAt &&
        durationSec == other.durationSec &&
        moodScore == other.moodScore &&
        summary == other.summary &&
        transcriptUrl == other.transcriptUrl &&
        audioUrl == other.audioUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        startedAt,
        durationSec,
        moodScore,
        summary,
        transcriptUrl,
        audioUrl
      ]);
}

CallStructStruct createCallStructStruct({
  String? id,
  DateTime? startedAt,
  int? durationSec,
  double? moodScore,
  String? summary,
  String? transcriptUrl,
  String? audioUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CallStructStruct(
      id: id,
      startedAt: startedAt,
      durationSec: durationSec,
      moodScore: moodScore,
      summary: summary,
      transcriptUrl: transcriptUrl,
      audioUrl: audioUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CallStructStruct? updateCallStructStruct(
  CallStructStruct? callStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    callStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCallStructStructData(
  Map<String, dynamic> firestoreData,
  CallStructStruct? callStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (callStruct == null) {
    return;
  }
  if (callStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && callStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final callStructData = getCallStructFirestoreData(callStruct, forFieldValue);
  final nestedData = callStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = callStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCallStructFirestoreData(
  CallStructStruct? callStruct, [
  bool forFieldValue = false,
]) {
  if (callStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(callStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(callStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCallStructListFirestoreData(
  List<CallStructStruct>? callStructs,
) =>
    callStructs?.map((e) => getCallStructFirestoreData(e, true)).toList() ?? [];

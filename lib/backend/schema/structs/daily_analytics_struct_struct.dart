// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Ежедневная аналитика
class DailyAnalyticsStructStruct extends FFFirebaseStruct {
  DailyAnalyticsStructStruct({
    DateTime? date,
    int? tasksCompleted,
    double? focusScore,
    double? stressScore,
    double? moodScore,
    int? callsCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _tasksCompleted = tasksCompleted,
        _focusScore = focusScore,
        _stressScore = stressScore,
        _moodScore = moodScore,
        _callsCount = callsCount,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "tasksCompleted" field.
  int? _tasksCompleted;
  int get tasksCompleted => _tasksCompleted ?? 0;
  set tasksCompleted(int? val) => _tasksCompleted = val;

  void incrementTasksCompleted(int amount) =>
      tasksCompleted = tasksCompleted + amount;

  bool hasTasksCompleted() => _tasksCompleted != null;

  // "focusScore" field.
  double? _focusScore;
  double get focusScore => _focusScore ?? 0.0;
  set focusScore(double? val) => _focusScore = val;

  void incrementFocusScore(double amount) => focusScore = focusScore + amount;

  bool hasFocusScore() => _focusScore != null;

  // "stressScore" field.
  double? _stressScore;
  double get stressScore => _stressScore ?? 0.0;
  set stressScore(double? val) => _stressScore = val;

  void incrementStressScore(double amount) =>
      stressScore = stressScore + amount;

  bool hasStressScore() => _stressScore != null;

  // "moodScore" field.
  double? _moodScore;
  double get moodScore => _moodScore ?? 0.0;
  set moodScore(double? val) => _moodScore = val;

  void incrementMoodScore(double amount) => moodScore = moodScore + amount;

  bool hasMoodScore() => _moodScore != null;

  // "callsCount" field.
  int? _callsCount;
  int get callsCount => _callsCount ?? 0;
  set callsCount(int? val) => _callsCount = val;

  void incrementCallsCount(int amount) => callsCount = callsCount + amount;

  bool hasCallsCount() => _callsCount != null;

  static DailyAnalyticsStructStruct fromMap(Map<String, dynamic> data) =>
      DailyAnalyticsStructStruct(
        date: data['date'] as DateTime?,
        tasksCompleted: castToType<int>(data['tasksCompleted']),
        focusScore: castToType<double>(data['focusScore']),
        stressScore: castToType<double>(data['stressScore']),
        moodScore: castToType<double>(data['moodScore']),
        callsCount: castToType<int>(data['callsCount']),
      );

  static DailyAnalyticsStructStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyAnalyticsStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'tasksCompleted': _tasksCompleted,
        'focusScore': _focusScore,
        'stressScore': _stressScore,
        'moodScore': _moodScore,
        'callsCount': _callsCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'tasksCompleted': serializeParam(
          _tasksCompleted,
          ParamType.int,
        ),
        'focusScore': serializeParam(
          _focusScore,
          ParamType.double,
        ),
        'stressScore': serializeParam(
          _stressScore,
          ParamType.double,
        ),
        'moodScore': serializeParam(
          _moodScore,
          ParamType.double,
        ),
        'callsCount': serializeParam(
          _callsCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static DailyAnalyticsStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DailyAnalyticsStructStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        tasksCompleted: deserializeParam(
          data['tasksCompleted'],
          ParamType.int,
          false,
        ),
        focusScore: deserializeParam(
          data['focusScore'],
          ParamType.double,
          false,
        ),
        stressScore: deserializeParam(
          data['stressScore'],
          ParamType.double,
          false,
        ),
        moodScore: deserializeParam(
          data['moodScore'],
          ParamType.double,
          false,
        ),
        callsCount: deserializeParam(
          data['callsCount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DailyAnalyticsStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyAnalyticsStructStruct &&
        date == other.date &&
        tasksCompleted == other.tasksCompleted &&
        focusScore == other.focusScore &&
        stressScore == other.stressScore &&
        moodScore == other.moodScore &&
        callsCount == other.callsCount;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [date, tasksCompleted, focusScore, stressScore, moodScore, callsCount]);
}

DailyAnalyticsStructStruct createDailyAnalyticsStructStruct({
  DateTime? date,
  int? tasksCompleted,
  double? focusScore,
  double? stressScore,
  double? moodScore,
  int? callsCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyAnalyticsStructStruct(
      date: date,
      tasksCompleted: tasksCompleted,
      focusScore: focusScore,
      stressScore: stressScore,
      moodScore: moodScore,
      callsCount: callsCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyAnalyticsStructStruct? updateDailyAnalyticsStructStruct(
  DailyAnalyticsStructStruct? dailyAnalyticsStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyAnalyticsStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyAnalyticsStructStructData(
  Map<String, dynamic> firestoreData,
  DailyAnalyticsStructStruct? dailyAnalyticsStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyAnalyticsStruct == null) {
    return;
  }
  if (dailyAnalyticsStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyAnalyticsStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyAnalyticsStructData =
      getDailyAnalyticsStructFirestoreData(dailyAnalyticsStruct, forFieldValue);
  final nestedData =
      dailyAnalyticsStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dailyAnalyticsStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyAnalyticsStructFirestoreData(
  DailyAnalyticsStructStruct? dailyAnalyticsStruct, [
  bool forFieldValue = false,
]) {
  if (dailyAnalyticsStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyAnalyticsStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(dailyAnalyticsStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyAnalyticsStructListFirestoreData(
  List<DailyAnalyticsStructStruct>? dailyAnalyticsStructs,
) =>
    dailyAnalyticsStructs
        ?.map((e) => getDailyAnalyticsStructFirestoreData(e, true))
        .toList() ??
    [];

// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AppliedScheduleStruct extends FFFirebaseStruct {
  AppliedScheduleStruct({
    String? taskId,
    DateTime? start,
    DateTime? end,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _taskId = taskId,
        _start = start,
        _end = end,
        super(firestoreUtilData);

  // "taskId" field.
  String? _taskId;
  String get taskId => _taskId ?? '';
  set taskId(String? val) => _taskId = val;

  bool hasTaskId() => _taskId != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  set start(DateTime? val) => _start = val;

  bool hasStart() => _start != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  set end(DateTime? val) => _end = val;

  bool hasEnd() => _end != null;

  static AppliedScheduleStruct fromMap(Map<String, dynamic> data) =>
      AppliedScheduleStruct(
        taskId: data['taskId'] as String?,
        start: data['start'] as DateTime?,
        end: data['end'] as DateTime?,
      );

  static AppliedScheduleStruct? maybeFromMap(dynamic data) => data is Map
      ? AppliedScheduleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'taskId': _taskId,
        'start': _start,
        'end': _end,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'taskId': serializeParam(
          _taskId,
          ParamType.String,
        ),
        'start': serializeParam(
          _start,
          ParamType.DateTime,
        ),
        'end': serializeParam(
          _end,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AppliedScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppliedScheduleStruct(
        taskId: deserializeParam(
          data['taskId'],
          ParamType.String,
          false,
        ),
        start: deserializeParam(
          data['start'],
          ParamType.DateTime,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AppliedScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppliedScheduleStruct &&
        taskId == other.taskId &&
        start == other.start &&
        end == other.end;
  }

  @override
  int get hashCode => const ListEquality().hash([taskId, start, end]);
}

AppliedScheduleStruct createAppliedScheduleStruct({
  String? taskId,
  DateTime? start,
  DateTime? end,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppliedScheduleStruct(
      taskId: taskId,
      start: start,
      end: end,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppliedScheduleStruct? updateAppliedScheduleStruct(
  AppliedScheduleStruct? appliedSchedule, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appliedSchedule
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppliedScheduleStructData(
  Map<String, dynamic> firestoreData,
  AppliedScheduleStruct? appliedSchedule,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appliedSchedule == null) {
    return;
  }
  if (appliedSchedule.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appliedSchedule.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appliedScheduleData =
      getAppliedScheduleFirestoreData(appliedSchedule, forFieldValue);
  final nestedData =
      appliedScheduleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appliedSchedule.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppliedScheduleFirestoreData(
  AppliedScheduleStruct? appliedSchedule, [
  bool forFieldValue = false,
]) {
  if (appliedSchedule == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appliedSchedule.toMap());

  // Add any Firestore field values
  mapToFirestore(appliedSchedule.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppliedScheduleListFirestoreData(
  List<AppliedScheduleStruct>? appliedSchedules,
) =>
    appliedSchedules
        ?.map((e) => getAppliedScheduleFirestoreData(e, true))
        .toList() ??
    [];

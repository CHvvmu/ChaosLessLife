// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Предложения для расписания
class TasksScheduleProposalsStruct extends FFFirebaseStruct {
  TasksScheduleProposalsStruct({
    String? taskId,
    String? title,
    DateTime? start,
    DateTime? end,
    int? durationMin,
    String? priority,
    String? energyType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _taskId = taskId,
        _title = title,
        _start = start,
        _end = end,
        _durationMin = durationMin,
        _priority = priority,
        _energyType = energyType,
        super(firestoreUtilData);

  // "taskId" field.
  String? _taskId;
  String get taskId => _taskId ?? '';
  set taskId(String? val) => _taskId = val;

  bool hasTaskId() => _taskId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

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

  // "durationMin" field.
  int? _durationMin;
  int get durationMin => _durationMin ?? 0;
  set durationMin(int? val) => _durationMin = val;

  void incrementDurationMin(int amount) => durationMin = durationMin + amount;

  bool hasDurationMin() => _durationMin != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  set priority(String? val) => _priority = val;

  bool hasPriority() => _priority != null;

  // "energyType" field.
  String? _energyType;
  String get energyType => _energyType ?? '';
  set energyType(String? val) => _energyType = val;

  bool hasEnergyType() => _energyType != null;

  static TasksScheduleProposalsStruct fromMap(Map<String, dynamic> data) =>
      TasksScheduleProposalsStruct(
        taskId: data['taskId'] as String?,
        title: data['title'] as String?,
        start: data['start'] as DateTime?,
        end: data['end'] as DateTime?,
        durationMin: castToType<int>(data['durationMin']),
        priority: data['priority'] as String?,
        energyType: data['energyType'] as String?,
      );

  static TasksScheduleProposalsStruct? maybeFromMap(dynamic data) => data is Map
      ? TasksScheduleProposalsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'taskId': _taskId,
        'title': _title,
        'start': _start,
        'end': _end,
        'durationMin': _durationMin,
        'priority': _priority,
        'energyType': _energyType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'taskId': serializeParam(
          _taskId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
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
        'durationMin': serializeParam(
          _durationMin,
          ParamType.int,
        ),
        'priority': serializeParam(
          _priority,
          ParamType.String,
        ),
        'energyType': serializeParam(
          _energyType,
          ParamType.String,
        ),
      }.withoutNulls;

  static TasksScheduleProposalsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TasksScheduleProposalsStruct(
        taskId: deserializeParam(
          data['taskId'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
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
        durationMin: deserializeParam(
          data['durationMin'],
          ParamType.int,
          false,
        ),
        priority: deserializeParam(
          data['priority'],
          ParamType.String,
          false,
        ),
        energyType: deserializeParam(
          data['energyType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TasksScheduleProposalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TasksScheduleProposalsStruct &&
        taskId == other.taskId &&
        title == other.title &&
        start == other.start &&
        end == other.end &&
        durationMin == other.durationMin &&
        priority == other.priority &&
        energyType == other.energyType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([taskId, title, start, end, durationMin, priority, energyType]);
}

TasksScheduleProposalsStruct createTasksScheduleProposalsStruct({
  String? taskId,
  String? title,
  DateTime? start,
  DateTime? end,
  int? durationMin,
  String? priority,
  String? energyType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TasksScheduleProposalsStruct(
      taskId: taskId,
      title: title,
      start: start,
      end: end,
      durationMin: durationMin,
      priority: priority,
      energyType: energyType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TasksScheduleProposalsStruct? updateTasksScheduleProposalsStruct(
  TasksScheduleProposalsStruct? tasksScheduleProposals, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tasksScheduleProposals
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTasksScheduleProposalsStructData(
  Map<String, dynamic> firestoreData,
  TasksScheduleProposalsStruct? tasksScheduleProposals,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tasksScheduleProposals == null) {
    return;
  }
  if (tasksScheduleProposals.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      tasksScheduleProposals.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tasksScheduleProposalsData = getTasksScheduleProposalsFirestoreData(
      tasksScheduleProposals, forFieldValue);
  final nestedData =
      tasksScheduleProposalsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      tasksScheduleProposals.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTasksScheduleProposalsFirestoreData(
  TasksScheduleProposalsStruct? tasksScheduleProposals, [
  bool forFieldValue = false,
]) {
  if (tasksScheduleProposals == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tasksScheduleProposals.toMap());

  // Add any Firestore field values
  mapToFirestore(tasksScheduleProposals.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTasksScheduleProposalsListFirestoreData(
  List<TasksScheduleProposalsStruct>? tasksScheduleProposalss,
) =>
    tasksScheduleProposalss
        ?.map((e) => getTasksScheduleProposalsFirestoreData(e, true))
        .toList() ??
    [];

// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Задачи
class TaskStructStruct extends FFFirebaseStruct {
  TaskStructStruct({
    String? taskId,
    String? title,
    DateTime? scheduledStart,
    DateTime? scheduledEnd,
    int? estimatedDurationMin,
    DateTime? dueDate,

    /// Вариант: deep
    String? energyType,
    String? priority,
    String? description,
    String? status,
    String? source,
    bool? crmSync,
    String? userId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _taskId = taskId,
        _title = title,
        _scheduledStart = scheduledStart,
        _scheduledEnd = scheduledEnd,
        _estimatedDurationMin = estimatedDurationMin,
        _dueDate = dueDate,
        _energyType = energyType,
        _priority = priority,
        _description = description,
        _status = status,
        _source = source,
        _crmSync = crmSync,
        _userId = userId,
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

  // "scheduledStart" field.
  DateTime? _scheduledStart;
  DateTime? get scheduledStart => _scheduledStart;
  set scheduledStart(DateTime? val) => _scheduledStart = val;

  bool hasScheduledStart() => _scheduledStart != null;

  // "scheduledEnd" field.
  DateTime? _scheduledEnd;
  DateTime? get scheduledEnd => _scheduledEnd;
  set scheduledEnd(DateTime? val) => _scheduledEnd = val;

  bool hasScheduledEnd() => _scheduledEnd != null;

  // "estimatedDurationMin" field.
  int? _estimatedDurationMin;
  int get estimatedDurationMin => _estimatedDurationMin ?? 0;
  set estimatedDurationMin(int? val) => _estimatedDurationMin = val;

  void incrementEstimatedDurationMin(int amount) =>
      estimatedDurationMin = estimatedDurationMin + amount;

  bool hasEstimatedDurationMin() => _estimatedDurationMin != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  set dueDate(DateTime? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

  // "energyType" field.
  String? _energyType;
  String get energyType => _energyType ?? '';
  set energyType(String? val) => _energyType = val;

  bool hasEnergyType() => _energyType != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  set priority(String? val) => _priority = val;

  bool hasPriority() => _priority != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  // "crmSync" field.
  bool? _crmSync;
  bool get crmSync => _crmSync ?? false;
  set crmSync(bool? val) => _crmSync = val;

  bool hasCrmSync() => _crmSync != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  static TaskStructStruct fromMap(Map<String, dynamic> data) =>
      TaskStructStruct(
        taskId: data['taskId'] as String?,
        title: data['title'] as String?,
        scheduledStart: data['scheduledStart'] as DateTime?,
        scheduledEnd: data['scheduledEnd'] as DateTime?,
        estimatedDurationMin: castToType<int>(data['estimatedDurationMin']),
        dueDate: data['dueDate'] as DateTime?,
        energyType: data['energyType'] as String?,
        priority: data['priority'] as String?,
        description: data['description'] as String?,
        status: data['status'] as String?,
        source: data['source'] as String?,
        crmSync: data['crmSync'] as bool?,
        userId: data['userId'] as String?,
      );

  static TaskStructStruct? maybeFromMap(dynamic data) => data is Map
      ? TaskStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'taskId': _taskId,
        'title': _title,
        'scheduledStart': _scheduledStart,
        'scheduledEnd': _scheduledEnd,
        'estimatedDurationMin': _estimatedDurationMin,
        'dueDate': _dueDate,
        'energyType': _energyType,
        'priority': _priority,
        'description': _description,
        'status': _status,
        'source': _source,
        'crmSync': _crmSync,
        'userId': _userId,
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
        'scheduledStart': serializeParam(
          _scheduledStart,
          ParamType.DateTime,
        ),
        'scheduledEnd': serializeParam(
          _scheduledEnd,
          ParamType.DateTime,
        ),
        'estimatedDurationMin': serializeParam(
          _estimatedDurationMin,
          ParamType.int,
        ),
        'dueDate': serializeParam(
          _dueDate,
          ParamType.DateTime,
        ),
        'energyType': serializeParam(
          _energyType,
          ParamType.String,
        ),
        'priority': serializeParam(
          _priority,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'crmSync': serializeParam(
          _crmSync,
          ParamType.bool,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskStructStruct(
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
        scheduledStart: deserializeParam(
          data['scheduledStart'],
          ParamType.DateTime,
          false,
        ),
        scheduledEnd: deserializeParam(
          data['scheduledEnd'],
          ParamType.DateTime,
          false,
        ),
        estimatedDurationMin: deserializeParam(
          data['estimatedDurationMin'],
          ParamType.int,
          false,
        ),
        dueDate: deserializeParam(
          data['dueDate'],
          ParamType.DateTime,
          false,
        ),
        energyType: deserializeParam(
          data['energyType'],
          ParamType.String,
          false,
        ),
        priority: deserializeParam(
          data['priority'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
        crmSync: deserializeParam(
          data['crmSync'],
          ParamType.bool,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskStructStruct &&
        taskId == other.taskId &&
        title == other.title &&
        scheduledStart == other.scheduledStart &&
        scheduledEnd == other.scheduledEnd &&
        estimatedDurationMin == other.estimatedDurationMin &&
        dueDate == other.dueDate &&
        energyType == other.energyType &&
        priority == other.priority &&
        description == other.description &&
        status == other.status &&
        source == other.source &&
        crmSync == other.crmSync &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        taskId,
        title,
        scheduledStart,
        scheduledEnd,
        estimatedDurationMin,
        dueDate,
        energyType,
        priority,
        description,
        status,
        source,
        crmSync,
        userId
      ]);
}

TaskStructStruct createTaskStructStruct({
  String? taskId,
  String? title,
  DateTime? scheduledStart,
  DateTime? scheduledEnd,
  int? estimatedDurationMin,
  DateTime? dueDate,
  String? energyType,
  String? priority,
  String? description,
  String? status,
  String? source,
  bool? crmSync,
  String? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TaskStructStruct(
      taskId: taskId,
      title: title,
      scheduledStart: scheduledStart,
      scheduledEnd: scheduledEnd,
      estimatedDurationMin: estimatedDurationMin,
      dueDate: dueDate,
      energyType: energyType,
      priority: priority,
      description: description,
      status: status,
      source: source,
      crmSync: crmSync,
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TaskStructStruct? updateTaskStructStruct(
  TaskStructStruct? taskStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    taskStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTaskStructStructData(
  Map<String, dynamic> firestoreData,
  TaskStructStruct? taskStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (taskStruct == null) {
    return;
  }
  if (taskStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && taskStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final taskStructData = getTaskStructFirestoreData(taskStruct, forFieldValue);
  final nestedData = taskStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = taskStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTaskStructFirestoreData(
  TaskStructStruct? taskStruct, [
  bool forFieldValue = false,
]) {
  if (taskStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(taskStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(taskStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTaskStructListFirestoreData(
  List<TaskStructStruct>? taskStructs,
) =>
    taskStructs?.map((e) => getTaskStructFirestoreData(e, true)).toList() ?? [];

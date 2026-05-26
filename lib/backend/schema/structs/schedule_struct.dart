// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Расписания
class ScheduleStruct extends FFFirebaseStruct {
  ScheduleStruct({
    String? taskId,
    String? title,
    String? description,
    DateTime? scheduledStart,
    DateTime? scheduledEnd,
    int? totalDurationMin,
    String? priority,

    /// Вариант: deep
    String? energyType,
    String? type,
    DateTime? dueDate,
    String? status,
    String? source,
    bool? crmSync,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _taskId = taskId,
        _title = title,
        _description = description,
        _scheduledStart = scheduledStart,
        _scheduledEnd = scheduledEnd,
        _totalDurationMin = totalDurationMin,
        _priority = priority,
        _energyType = energyType,
        _type = type,
        _dueDate = dueDate,
        _status = status,
        _source = source,
        _crmSync = crmSync,
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

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

  // "totalDurationMin" field.
  int? _totalDurationMin;
  int get totalDurationMin => _totalDurationMin ?? 0;
  set totalDurationMin(int? val) => _totalDurationMin = val;

  void incrementTotalDurationMin(int amount) =>
      totalDurationMin = totalDurationMin + amount;

  bool hasTotalDurationMin() => _totalDurationMin != null;

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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  set dueDate(DateTime? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

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

  static ScheduleStruct fromMap(Map<String, dynamic> data) => ScheduleStruct(
        taskId: data['taskId'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        scheduledStart: data['scheduledStart'] as DateTime?,
        scheduledEnd: data['scheduledEnd'] as DateTime?,
        totalDurationMin: castToType<int>(data['totalDurationMin']),
        priority: data['priority'] as String?,
        energyType: data['energyType'] as String?,
        type: data['type'] as String?,
        dueDate: data['dueDate'] as DateTime?,
        status: data['status'] as String?,
        source: data['source'] as String?,
        crmSync: data['crmSync'] as bool?,
      );

  static ScheduleStruct? maybeFromMap(dynamic data) =>
      data is Map ? ScheduleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'taskId': _taskId,
        'title': _title,
        'description': _description,
        'scheduledStart': _scheduledStart,
        'scheduledEnd': _scheduledEnd,
        'totalDurationMin': _totalDurationMin,
        'priority': _priority,
        'energyType': _energyType,
        'type': _type,
        'dueDate': _dueDate,
        'status': _status,
        'source': _source,
        'crmSync': _crmSync,
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
        'description': serializeParam(
          _description,
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
        'totalDurationMin': serializeParam(
          _totalDurationMin,
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
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'dueDate': serializeParam(
          _dueDate,
          ParamType.DateTime,
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
      }.withoutNulls;

  static ScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScheduleStruct(
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
        description: deserializeParam(
          data['description'],
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
        totalDurationMin: deserializeParam(
          data['totalDurationMin'],
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
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        dueDate: deserializeParam(
          data['dueDate'],
          ParamType.DateTime,
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
      );

  @override
  String toString() => 'ScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScheduleStruct &&
        taskId == other.taskId &&
        title == other.title &&
        description == other.description &&
        scheduledStart == other.scheduledStart &&
        scheduledEnd == other.scheduledEnd &&
        totalDurationMin == other.totalDurationMin &&
        priority == other.priority &&
        energyType == other.energyType &&
        type == other.type &&
        dueDate == other.dueDate &&
        status == other.status &&
        source == other.source &&
        crmSync == other.crmSync;
  }

  @override
  int get hashCode => const ListEquality().hash([
        taskId,
        title,
        description,
        scheduledStart,
        scheduledEnd,
        totalDurationMin,
        priority,
        energyType,
        type,
        dueDate,
        status,
        source,
        crmSync
      ]);
}

ScheduleStruct createScheduleStruct({
  String? taskId,
  String? title,
  String? description,
  DateTime? scheduledStart,
  DateTime? scheduledEnd,
  int? totalDurationMin,
  String? priority,
  String? energyType,
  String? type,
  DateTime? dueDate,
  String? status,
  String? source,
  bool? crmSync,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScheduleStruct(
      taskId: taskId,
      title: title,
      description: description,
      scheduledStart: scheduledStart,
      scheduledEnd: scheduledEnd,
      totalDurationMin: totalDurationMin,
      priority: priority,
      energyType: energyType,
      type: type,
      dueDate: dueDate,
      status: status,
      source: source,
      crmSync: crmSync,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScheduleStruct? updateScheduleStruct(
  ScheduleStruct? schedule, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    schedule
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScheduleStructData(
  Map<String, dynamic> firestoreData,
  ScheduleStruct? schedule,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (schedule == null) {
    return;
  }
  if (schedule.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && schedule.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scheduleData = getScheduleFirestoreData(schedule, forFieldValue);
  final nestedData = scheduleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = schedule.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScheduleFirestoreData(
  ScheduleStruct? schedule, [
  bool forFieldValue = false,
]) {
  if (schedule == null) {
    return {};
  }
  final firestoreData = mapToFirestore(schedule.toMap());

  // Add any Firestore field values
  mapToFirestore(schedule.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScheduleListFirestoreData(
  List<ScheduleStruct>? schedules,
) =>
    schedules?.map((e) => getScheduleFirestoreData(e, true)).toList() ?? [];

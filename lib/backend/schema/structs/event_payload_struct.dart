// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EventPayloadStruct extends FFFirebaseStruct {
  EventPayloadStruct({
    String? title,
    String? status,
    String? taskId,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _status = status,
        _taskId = taskId,
        _description = description,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "taskId" field.
  String? _taskId;
  String get taskId => _taskId ?? '';
  set taskId(String? val) => _taskId = val;

  bool hasTaskId() => _taskId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static EventPayloadStruct fromMap(Map<String, dynamic> data) =>
      EventPayloadStruct(
        title: data['title'] as String?,
        status: data['status'] as String?,
        taskId: data['taskId'] as String?,
        description: data['description'] as String?,
      );

  static EventPayloadStruct? maybeFromMap(dynamic data) => data is Map
      ? EventPayloadStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'status': _status,
        'taskId': _taskId,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'taskId': serializeParam(
          _taskId,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventPayloadStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventPayloadStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        taskId: deserializeParam(
          data['taskId'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EventPayloadStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventPayloadStruct &&
        title == other.title &&
        status == other.status &&
        taskId == other.taskId &&
        description == other.description;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, status, taskId, description]);
}

EventPayloadStruct createEventPayloadStruct({
  String? title,
  String? status,
  String? taskId,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventPayloadStruct(
      title: title,
      status: status,
      taskId: taskId,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventPayloadStruct? updateEventPayloadStruct(
  EventPayloadStruct? eventPayload, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventPayload
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventPayloadStructData(
  Map<String, dynamic> firestoreData,
  EventPayloadStruct? eventPayload,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventPayload == null) {
    return;
  }
  if (eventPayload.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventPayload.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventPayloadData =
      getEventPayloadFirestoreData(eventPayload, forFieldValue);
  final nestedData =
      eventPayloadData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventPayload.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventPayloadFirestoreData(
  EventPayloadStruct? eventPayload, [
  bool forFieldValue = false,
]) {
  if (eventPayload == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventPayload.toMap());

  // Add any Firestore field values
  mapToFirestore(eventPayload.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventPayloadListFirestoreData(
  List<EventPayloadStruct>? eventPayloads,
) =>
    eventPayloads?.map((e) => getEventPayloadFirestoreData(e, true)).toList() ??
    [];

// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Сообщения
class MessageStructStruct extends FFFirebaseStruct {
  MessageStructStruct({
    String? id,
    String? channel,
    String? author,
    String? text,
    String? aiDraft,
    DateTime? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _channel = channel,
        _author = author,
        _text = text,
        _aiDraft = aiDraft,
        _timestamp = timestamp,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  set channel(String? val) => _channel = val;

  bool hasChannel() => _channel != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "aiDraft" field.
  String? _aiDraft;
  String get aiDraft => _aiDraft ?? '';
  set aiDraft(String? val) => _aiDraft = val;

  bool hasAiDraft() => _aiDraft != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static MessageStructStruct fromMap(Map<String, dynamic> data) =>
      MessageStructStruct(
        id: data['id'] as String?,
        channel: data['channel'] as String?,
        author: data['author'] as String?,
        text: data['text'] as String?,
        aiDraft: data['aiDraft'] as String?,
        timestamp: data['timestamp'] as DateTime?,
      );

  static MessageStructStruct? maybeFromMap(dynamic data) => data is Map
      ? MessageStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'channel': _channel,
        'author': _author,
        'text': _text,
        'aiDraft': _aiDraft,
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'channel': serializeParam(
          _channel,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'aiDraft': serializeParam(
          _aiDraft,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MessageStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStructStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        channel: deserializeParam(
          data['channel'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        aiDraft: deserializeParam(
          data['aiDraft'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'MessageStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageStructStruct &&
        id == other.id &&
        channel == other.channel &&
        author == other.author &&
        text == other.text &&
        aiDraft == other.aiDraft &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, channel, author, text, aiDraft, timestamp]);
}

MessageStructStruct createMessageStructStruct({
  String? id,
  String? channel,
  String? author,
  String? text,
  String? aiDraft,
  DateTime? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageStructStruct(
      id: id,
      channel: channel,
      author: author,
      text: text,
      aiDraft: aiDraft,
      timestamp: timestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageStructStruct? updateMessageStructStruct(
  MessageStructStruct? messageStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    messageStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageStructStructData(
  Map<String, dynamic> firestoreData,
  MessageStructStruct? messageStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (messageStruct == null) {
    return;
  }
  if (messageStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && messageStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageStructData =
      getMessageStructFirestoreData(messageStruct, forFieldValue);
  final nestedData =
      messageStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = messageStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageStructFirestoreData(
  MessageStructStruct? messageStruct, [
  bool forFieldValue = false,
]) {
  if (messageStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(messageStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(messageStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageStructListFirestoreData(
  List<MessageStructStruct>? messageStructs,
) =>
    messageStructs
        ?.map((e) => getMessageStructFirestoreData(e, true))
        .toList() ??
    [];

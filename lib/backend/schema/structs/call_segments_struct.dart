// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Сегменты звонков.
///
/// Для коллекции Call_raw_transcripts
class CallSegmentsStruct extends FFFirebaseStruct {
  CallSegmentsStruct({
    String? speaker,
    String? text,
    double? start,
    double? end,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _speaker = speaker,
        _text = text,
        _start = start,
        _end = end,
        super(firestoreUtilData);

  // "speaker" field.
  String? _speaker;
  String get speaker => _speaker ?? '';
  set speaker(String? val) => _speaker = val;

  bool hasSpeaker() => _speaker != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "start" field.
  double? _start;
  double get start => _start ?? 0.0;
  set start(double? val) => _start = val;

  void incrementStart(double amount) => start = start + amount;

  bool hasStart() => _start != null;

  // "end" field.
  double? _end;
  double get end => _end ?? 0.0;
  set end(double? val) => _end = val;

  void incrementEnd(double amount) => end = end + amount;

  bool hasEnd() => _end != null;

  static CallSegmentsStruct fromMap(Map<String, dynamic> data) =>
      CallSegmentsStruct(
        speaker: data['speaker'] as String?,
        text: data['text'] as String?,
        start: castToType<double>(data['start']),
        end: castToType<double>(data['end']),
      );

  static CallSegmentsStruct? maybeFromMap(dynamic data) => data is Map
      ? CallSegmentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'speaker': _speaker,
        'text': _text,
        'start': _start,
        'end': _end,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'speaker': serializeParam(
          _speaker,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'start': serializeParam(
          _start,
          ParamType.double,
        ),
        'end': serializeParam(
          _end,
          ParamType.double,
        ),
      }.withoutNulls;

  static CallSegmentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CallSegmentsStruct(
        speaker: deserializeParam(
          data['speaker'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        start: deserializeParam(
          data['start'],
          ParamType.double,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CallSegmentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CallSegmentsStruct &&
        speaker == other.speaker &&
        text == other.text &&
        start == other.start &&
        end == other.end;
  }

  @override
  int get hashCode => const ListEquality().hash([speaker, text, start, end]);
}

CallSegmentsStruct createCallSegmentsStruct({
  String? speaker,
  String? text,
  double? start,
  double? end,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CallSegmentsStruct(
      speaker: speaker,
      text: text,
      start: start,
      end: end,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CallSegmentsStruct? updateCallSegmentsStruct(
  CallSegmentsStruct? callSegments, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    callSegments
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCallSegmentsStructData(
  Map<String, dynamic> firestoreData,
  CallSegmentsStruct? callSegments,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (callSegments == null) {
    return;
  }
  if (callSegments.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && callSegments.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final callSegmentsData =
      getCallSegmentsFirestoreData(callSegments, forFieldValue);
  final nestedData =
      callSegmentsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = callSegments.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCallSegmentsFirestoreData(
  CallSegmentsStruct? callSegments, [
  bool forFieldValue = false,
]) {
  if (callSegments == null) {
    return {};
  }
  final firestoreData = mapToFirestore(callSegments.toMap());

  // Add any Firestore field values
  mapToFirestore(callSegments.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCallSegmentsListFirestoreData(
  List<CallSegmentsStruct>? callSegmentss,
) =>
    callSegmentss?.map((e) => getCallSegmentsFirestoreData(e, true)).toList() ??
    [];

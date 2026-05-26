import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Append-only telemetry events for behavior tracking.
class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "payload" field.
  EventPayloadStruct? _payload;
  EventPayloadStruct get payload => _payload ?? EventPayloadStruct();
  bool hasPayload() => _payload != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _type = snapshotData['type'] as String?;
    _source = snapshotData['source'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _payload = snapshotData['payload'] is EventPayloadStruct
        ? snapshotData['payload']
        : EventPayloadStruct.maybeFromMap(snapshotData['payload']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? userId,
  String? sessionId,
  String? type,
  String? source,
  DateTime? timestamp,
  EventPayloadStruct? payload,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'sessionId': sessionId,
      'type': type,
      'source': source,
      'timestamp': timestamp,
      'payload': EventPayloadStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "payload" field.
  addEventPayloadStructData(firestoreData, payload, 'payload');

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.sessionId == e2?.sessionId &&
        e1?.type == e2?.type &&
        e1?.source == e2?.source &&
        e1?.timestamp == e2?.timestamp &&
        e1?.payload == e2?.payload;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash(
      [e?.userId, e?.sessionId, e?.type, e?.source, e?.timestamp, e?.payload]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}

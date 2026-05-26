import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AIMemoryShortRecord extends FirestoreRecord {
  AIMemoryShortRecord._(
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

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "expiresAt" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  bool hasExpiresAt() => _expiresAt != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _expiresAt = snapshotData['expiresAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AI_memory_short');

  static Stream<AIMemoryShortRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AIMemoryShortRecord.fromSnapshot(s));

  static Future<AIMemoryShortRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AIMemoryShortRecord.fromSnapshot(s));

  static AIMemoryShortRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AIMemoryShortRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AIMemoryShortRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AIMemoryShortRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AIMemoryShortRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AIMemoryShortRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAIMemoryShortRecordData({
  String? userId,
  String? sessionId,
  String? text,
  DateTime? timestamp,
  DateTime? expiresAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'sessionId': sessionId,
      'text': text,
      'timestamp': timestamp,
      'expiresAt': expiresAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AIMemoryShortRecordDocumentEquality
    implements Equality<AIMemoryShortRecord> {
  const AIMemoryShortRecordDocumentEquality();

  @override
  bool equals(AIMemoryShortRecord? e1, AIMemoryShortRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.sessionId == e2?.sessionId &&
        e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp &&
        e1?.expiresAt == e2?.expiresAt;
  }

  @override
  int hash(AIMemoryShortRecord? e) => const ListEquality()
      .hash([e?.userId, e?.sessionId, e?.text, e?.timestamp, e?.expiresAt]);

  @override
  bool isValidKey(Object? o) => o is AIMemoryShortRecord;
}

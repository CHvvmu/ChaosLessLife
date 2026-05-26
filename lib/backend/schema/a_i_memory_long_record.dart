import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AIMemoryLongRecord extends FirestoreRecord {
  AIMemoryLongRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "vectorId" field.
  String? _vectorId;
  String get vectorId => _vectorId ?? '';
  bool hasVectorId() => _vectorId != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _vectorId = snapshotData['vectorId'] as String?;
    _summary = snapshotData['summary'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AI_memory_long');

  static Stream<AIMemoryLongRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AIMemoryLongRecord.fromSnapshot(s));

  static Future<AIMemoryLongRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AIMemoryLongRecord.fromSnapshot(s));

  static AIMemoryLongRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AIMemoryLongRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AIMemoryLongRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AIMemoryLongRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AIMemoryLongRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AIMemoryLongRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAIMemoryLongRecordData({
  String? userId,
  String? vectorId,
  String? summary,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'vectorId': vectorId,
      'summary': summary,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AIMemoryLongRecordDocumentEquality
    implements Equality<AIMemoryLongRecord> {
  const AIMemoryLongRecordDocumentEquality();

  @override
  bool equals(AIMemoryLongRecord? e1, AIMemoryLongRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.vectorId == e2?.vectorId &&
        e1?.summary == e2?.summary &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(AIMemoryLongRecord? e) => const ListEquality()
      .hash([e?.userId, e?.vectorId, e?.summary, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is AIMemoryLongRecord;
}

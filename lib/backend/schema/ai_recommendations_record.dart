import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// AI-generated recommendations shown on the HomePage.
class AiRecommendationsRecord extends FirestoreRecord {
  AiRecommendationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _text = snapshotData['text'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ai_recommendations');

  static Stream<AiRecommendationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AiRecommendationsRecord.fromSnapshot(s));

  static Future<AiRecommendationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AiRecommendationsRecord.fromSnapshot(s));

  static AiRecommendationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AiRecommendationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AiRecommendationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AiRecommendationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AiRecommendationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AiRecommendationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAiRecommendationsRecordData({
  String? userId,
  String? text,
  DateTime? createdAt,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'text': text,
      'createdAt': createdAt,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class AiRecommendationsRecordDocumentEquality
    implements Equality<AiRecommendationsRecord> {
  const AiRecommendationsRecordDocumentEquality();

  @override
  bool equals(AiRecommendationsRecord? e1, AiRecommendationsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.text == e2?.text &&
        e1?.createdAt == e2?.createdAt &&
        e1?.status == e2?.status;
  }

  @override
  int hash(AiRecommendationsRecord? e) =>
      const ListEquality().hash([e?.userId, e?.text, e?.createdAt, e?.status]);

  @override
  bool isValidKey(Object? o) => o is AiRecommendationsRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LifeEventsRecord extends FirestoreRecord {
  LifeEventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "importanceScore" field.
  double? _importanceScore;
  double get importanceScore => _importanceScore ?? 0.0;
  bool hasImportanceScore() => _importanceScore != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _type = snapshotData['type'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _importanceScore = castToType<double>(snapshotData['importanceScore']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Life_events');

  static Stream<LifeEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LifeEventsRecord.fromSnapshot(s));

  static Future<LifeEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LifeEventsRecord.fromSnapshot(s));

  static LifeEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LifeEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LifeEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LifeEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LifeEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LifeEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLifeEventsRecordData({
  String? userId,
  String? type,
  DateTime? timestamp,
  double? importanceScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'type': type,
      'timestamp': timestamp,
      'importanceScore': importanceScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class LifeEventsRecordDocumentEquality implements Equality<LifeEventsRecord> {
  const LifeEventsRecordDocumentEquality();

  @override
  bool equals(LifeEventsRecord? e1, LifeEventsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.type == e2?.type &&
        e1?.timestamp == e2?.timestamp &&
        e1?.importanceScore == e2?.importanceScore;
  }

  @override
  int hash(LifeEventsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.type, e?.timestamp, e?.importanceScore]);

  @override
  bool isValidKey(Object? o) => o is LifeEventsRecord;
}

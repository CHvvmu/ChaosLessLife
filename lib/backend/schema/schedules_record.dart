import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchedulesRecord extends FirestoreRecord {
  SchedulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "sourceProposalId" field.
  String? _sourceProposalId;
  String get sourceProposalId => _sourceProposalId ?? '';
  bool hasSourceProposalId() => _sourceProposalId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _sourceProposalId = snapshotData['sourceProposalId'] as String?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Schedules');

  static Stream<SchedulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchedulesRecord.fromSnapshot(s));

  static Future<SchedulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchedulesRecord.fromSnapshot(s));

  static SchedulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchedulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchedulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchedulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchedulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchedulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchedulesRecordData({
  String? userId,
  DateTime? date,
  String? sourceProposalId,
  String? status,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'date': date,
      'sourceProposalId': sourceProposalId,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchedulesRecordDocumentEquality implements Equality<SchedulesRecord> {
  const SchedulesRecordDocumentEquality();

  @override
  bool equals(SchedulesRecord? e1, SchedulesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.date == e2?.date &&
        e1?.sourceProposalId == e2?.sourceProposalId &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(SchedulesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.date,
        e?.sourceProposalId,
        e?.status,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is SchedulesRecord;
}

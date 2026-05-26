import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistorySchedulesRecord extends FirestoreRecord {
  HistorySchedulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  bool hasStart() => _start != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  bool hasEnd() => _end != null;

  // "proposalId" field.
  String? _proposalId;
  String get proposalId => _proposalId ?? '';
  bool hasProposalId() => _proposalId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _start = snapshotData['start'] as DateTime?;
    _end = snapshotData['end'] as DateTime?;
    _proposalId = snapshotData['proposalId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('historySchedules')
          : FirebaseFirestore.instance.collectionGroup('historySchedules');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('historySchedules').doc(id);

  static Stream<HistorySchedulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistorySchedulesRecord.fromSnapshot(s));

  static Future<HistorySchedulesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HistorySchedulesRecord.fromSnapshot(s));

  static HistorySchedulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistorySchedulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistorySchedulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistorySchedulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistorySchedulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistorySchedulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistorySchedulesRecordData({
  String? type,
  DateTime? start,
  DateTime? end,
  String? proposalId,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'start': start,
      'end': end,
      'proposalId': proposalId,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistorySchedulesRecordDocumentEquality
    implements Equality<HistorySchedulesRecord> {
  const HistorySchedulesRecordDocumentEquality();

  @override
  bool equals(HistorySchedulesRecord? e1, HistorySchedulesRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.start == e2?.start &&
        e1?.end == e2?.end &&
        e1?.proposalId == e2?.proposalId &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(HistorySchedulesRecord? e) => const ListEquality()
      .hash([e?.type, e?.start, e?.end, e?.proposalId, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is HistorySchedulesRecord;
}

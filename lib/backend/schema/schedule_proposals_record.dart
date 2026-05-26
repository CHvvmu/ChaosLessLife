import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Предложения по расписанию задач на текущий день
class ScheduleProposalsRecord extends FirestoreRecord {
  ScheduleProposalsRecord._(
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

  // "status" field.
  String? _status;

  /// Варианты; pending,  applied, rejected (В ожидании,  применено, отклонено)
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "proposalId" field.
  String? _proposalId;
  String get proposalId => _proposalId ?? '';
  bool hasProposalId() => _proposalId != null;

  // "tasks" field.
  List<TasksScheduleProposalsStruct>? _tasks;
  List<TasksScheduleProposalsStruct> get tasks => _tasks ?? const [];
  bool hasTasks() => _tasks != null;

  // "schedule" field.
  List<ScheduleStruct>? _schedule;
  List<ScheduleStruct> get schedule => _schedule ?? const [];
  bool hasSchedule() => _schedule != null;

  // "appliedAt" field.
  DateTime? _appliedAt;
  DateTime? get appliedAt => _appliedAt;
  bool hasAppliedAt() => _appliedAt != null;

  // "appliedSchedule" field.
  List<AppliedScheduleStruct>? _appliedSchedule;
  List<AppliedScheduleStruct> get appliedSchedule =>
      _appliedSchedule ?? const [];
  bool hasAppliedSchedule() => _appliedSchedule != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _proposalId = snapshotData['proposalId'] as String?;
    _tasks = getStructList(
      snapshotData['tasks'],
      TasksScheduleProposalsStruct.fromMap,
    );
    _schedule = getStructList(
      snapshotData['schedule'],
      ScheduleStruct.fromMap,
    );
    _appliedAt = snapshotData['appliedAt'] as DateTime?;
    _appliedSchedule = getStructList(
      snapshotData['appliedSchedule'],
      AppliedScheduleStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Schedule_Proposals');

  static Stream<ScheduleProposalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduleProposalsRecord.fromSnapshot(s));

  static Future<ScheduleProposalsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ScheduleProposalsRecord.fromSnapshot(s));

  static ScheduleProposalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduleProposalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduleProposalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduleProposalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduleProposalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduleProposalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduleProposalsRecordData({
  String? userId,
  DateTime? date,
  String? status,
  DateTime? createdAt,
  String? proposalId,
  DateTime? appliedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'date': date,
      'status': status,
      'createdAt': createdAt,
      'proposalId': proposalId,
      'appliedAt': appliedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduleProposalsRecordDocumentEquality
    implements Equality<ScheduleProposalsRecord> {
  const ScheduleProposalsRecordDocumentEquality();

  @override
  bool equals(ScheduleProposalsRecord? e1, ScheduleProposalsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.date == e2?.date &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.proposalId == e2?.proposalId &&
        listEquality.equals(e1?.tasks, e2?.tasks) &&
        listEquality.equals(e1?.schedule, e2?.schedule) &&
        e1?.appliedAt == e2?.appliedAt &&
        listEquality.equals(e1?.appliedSchedule, e2?.appliedSchedule);
  }

  @override
  int hash(ScheduleProposalsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.date,
        e?.status,
        e?.createdAt,
        e?.proposalId,
        e?.tasks,
        e?.schedule,
        e?.appliedAt,
        e?.appliedSchedule
      ]);

  @override
  bool isValidKey(Object? o) => o is ScheduleProposalsRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksSubRecord extends FirestoreRecord {
  TasksSubRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  bool hasPriority() => _priority != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "crmSync" field.
  bool? _crmSync;
  bool get crmSync => _crmSync ?? false;
  bool hasCrmSync() => _crmSync != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "scheduledStart" field.
  DateTime? _scheduledStart;
  DateTime? get scheduledStart => _scheduledStart;
  bool hasScheduledStart() => _scheduledStart != null;

  // "scheduledEnd" field.
  DateTime? _scheduledEnd;
  DateTime? get scheduledEnd => _scheduledEnd;
  bool hasScheduledEnd() => _scheduledEnd != null;

  // "estimatedDurationMin" field.
  int? _estimatedDurationMin;
  int get estimatedDurationMin => _estimatedDurationMin ?? 0;
  bool hasEstimatedDurationMin() => _estimatedDurationMin != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _priority = snapshotData['priority'] as String?;
    _status = snapshotData['status'] as String?;
    _source = snapshotData['source'] as String?;
    _crmSync = snapshotData['crmSync'] as bool?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _scheduledStart = snapshotData['scheduledStart'] as DateTime?;
    _scheduledEnd = snapshotData['scheduledEnd'] as DateTime?;
    _estimatedDurationMin =
        castToType<int>(snapshotData['estimatedDurationMin']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tasksSub')
          : FirebaseFirestore.instance.collectionGroup('tasksSub');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tasksSub').doc(id);

  static Stream<TasksSubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksSubRecord.fromSnapshot(s));

  static Future<TasksSubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksSubRecord.fromSnapshot(s));

  static TasksSubRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TasksSubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksSubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksSubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksSubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksSubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksSubRecordData({
  String? userId,
  String? title,
  String? description,
  DateTime? dueDate,
  String? priority,
  String? status,
  String? source,
  bool? crmSync,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? type,
  DateTime? scheduledStart,
  DateTime? scheduledEnd,
  int? estimatedDurationMin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'priority': priority,
      'status': status,
      'source': source,
      'crmSync': crmSync,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'type': type,
      'scheduledStart': scheduledStart,
      'scheduledEnd': scheduledEnd,
      'estimatedDurationMin': estimatedDurationMin,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksSubRecordDocumentEquality implements Equality<TasksSubRecord> {
  const TasksSubRecordDocumentEquality();

  @override
  bool equals(TasksSubRecord? e1, TasksSubRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.dueDate == e2?.dueDate &&
        e1?.priority == e2?.priority &&
        e1?.status == e2?.status &&
        e1?.source == e2?.source &&
        e1?.crmSync == e2?.crmSync &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.type == e2?.type &&
        e1?.scheduledStart == e2?.scheduledStart &&
        e1?.scheduledEnd == e2?.scheduledEnd &&
        e1?.estimatedDurationMin == e2?.estimatedDurationMin;
  }

  @override
  int hash(TasksSubRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.title,
        e?.description,
        e?.dueDate,
        e?.priority,
        e?.status,
        e?.source,
        e?.crmSync,
        e?.createdAt,
        e?.updatedAt,
        e?.type,
        e?.scheduledStart,
        e?.scheduledEnd,
        e?.estimatedDurationMin
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksSubRecord;
}

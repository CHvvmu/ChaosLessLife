import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
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

  /// Варианты: "active",  "done", "postponed"
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

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "completedAt" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  bool hasCompletedAt() => _completedAt != null;

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

  /// Предполагаемая продолжительность, мин.
  int get estimatedDurationMin => _estimatedDurationMin ?? 0;
  bool hasEstimatedDurationMin() => _estimatedDurationMin != null;

  // "energyType" field.
  String? _energyType;

  /// Варианты типа : "deep", "shallow"
  String get energyType => _energyType ?? '';
  bool hasEnergyType() => _energyType != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "flexibility" field.
  int? _flexibility;
  int get flexibility => _flexibility ?? 0;
  bool hasFlexibility() => _flexibility != null;

  // "manualStart" field.
  DateTime? _manualStart;
  DateTime? get manualStart => _manualStart;
  bool hasManualStart() => _manualStart != null;

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
    _sessionId = snapshotData['sessionId'] as String?;
    _completedAt = snapshotData['completedAt'] as DateTime?;
    _scheduledStart = snapshotData['scheduledStart'] as DateTime?;
    _scheduledEnd = snapshotData['scheduledEnd'] as DateTime?;
    _estimatedDurationMin =
        castToType<int>(snapshotData['estimatedDurationMin']);
    _energyType = snapshotData['energyType'] as String?;
    _type = snapshotData['type'] as String?;
    _flexibility = castToType<int>(snapshotData['flexibility']);
    _manualStart = snapshotData['manualStart'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
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
  String? sessionId,
  DateTime? completedAt,
  DateTime? scheduledStart,
  DateTime? scheduledEnd,
  int? estimatedDurationMin,
  String? energyType,
  String? type,
  int? flexibility,
  DateTime? manualStart,
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
      'sessionId': sessionId,
      'completedAt': completedAt,
      'scheduledStart': scheduledStart,
      'scheduledEnd': scheduledEnd,
      'estimatedDurationMin': estimatedDurationMin,
      'energyType': energyType,
      'type': type,
      'flexibility': flexibility,
      'manualStart': manualStart,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
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
        e1?.sessionId == e2?.sessionId &&
        e1?.completedAt == e2?.completedAt &&
        e1?.scheduledStart == e2?.scheduledStart &&
        e1?.scheduledEnd == e2?.scheduledEnd &&
        e1?.estimatedDurationMin == e2?.estimatedDurationMin &&
        e1?.energyType == e2?.energyType &&
        e1?.type == e2?.type &&
        e1?.flexibility == e2?.flexibility &&
        e1?.manualStart == e2?.manualStart;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
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
        e?.sessionId,
        e?.completedAt,
        e?.scheduledStart,
        e?.scheduledEnd,
        e?.estimatedDurationMin,
        e?.energyType,
        e?.type,
        e?.flexibility,
        e?.manualStart
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}

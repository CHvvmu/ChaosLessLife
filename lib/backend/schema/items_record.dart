import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taskId" field.
  String? _taskId;
  String get taskId => _taskId ?? '';
  bool hasTaskId() => _taskId != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  bool hasStart() => _start != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  bool hasEnd() => _end != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "locked" field.
  bool? _locked;
  bool get locked => _locked ?? false;
  bool hasLocked() => _locked != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "durationMin" field.
  int? _durationMin;
  int get durationMin => _durationMin ?? 0;
  bool hasDurationMin() => _durationMin != null;

  // "manualStart" field.
  DateTime? _manualStart;
  DateTime? get manualStart => _manualStart;
  bool hasManualStart() => _manualStart != null;

  // "manualEnd" field.
  DateTime? _manualEnd;
  DateTime? get manualEnd => _manualEnd;
  bool hasManualEnd() => _manualEnd != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _taskId = snapshotData['taskId'] as String?;
    _start = snapshotData['start'] as DateTime?;
    _end = snapshotData['end'] as DateTime?;
    _order = castToType<int>(snapshotData['order']);
    _status = snapshotData['status'] as String?;
    _locked = snapshotData['locked'] as bool?;
    _source = snapshotData['source'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _durationMin = castToType<int>(snapshotData['durationMin']);
    _manualStart = snapshotData['manualStart'] as DateTime?;
    _manualEnd = snapshotData['manualEnd'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('items')
          : FirebaseFirestore.instance.collectionGroup('items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('items').doc(id);

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? taskId,
  DateTime? start,
  DateTime? end,
  int? order,
  String? status,
  bool? locked,
  String? source,
  DateTime? createdAt,
  String? title,
  String? description,
  int? durationMin,
  DateTime? manualStart,
  DateTime? manualEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskId': taskId,
      'start': start,
      'end': end,
      'order': order,
      'status': status,
      'locked': locked,
      'source': source,
      'createdAt': createdAt,
      'title': title,
      'description': description,
      'durationMin': durationMin,
      'manualStart': manualStart,
      'manualEnd': manualEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.taskId == e2?.taskId &&
        e1?.start == e2?.start &&
        e1?.end == e2?.end &&
        e1?.order == e2?.order &&
        e1?.status == e2?.status &&
        e1?.locked == e2?.locked &&
        e1?.source == e2?.source &&
        e1?.createdAt == e2?.createdAt &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.durationMin == e2?.durationMin &&
        e1?.manualStart == e2?.manualStart &&
        e1?.manualEnd == e2?.manualEnd;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash([
        e?.taskId,
        e?.start,
        e?.end,
        e?.order,
        e?.status,
        e?.locked,
        e?.source,
        e?.createdAt,
        e?.title,
        e?.description,
        e?.durationMin,
        e?.manualStart,
        e?.manualEnd
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}

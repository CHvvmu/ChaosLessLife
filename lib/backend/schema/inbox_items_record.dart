import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Коллекция DSL inbox_items
class InboxItemsRecord extends FirestoreRecord {
  InboxItemsRecord._(
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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "captureSessionId" field.
  String? _captureSessionId;
  String get captureSessionId => _captureSessionId ?? '';
  bool hasCaptureSessionId() => _captureSessionId != null;

  // "aiSessionId" field.
  String? _aiSessionId;
  String get aiSessionId => _aiSessionId ?? '';
  bool hasAiSessionId() => _aiSessionId != null;

  // "taskId" field.
  String? _taskId;
  String get taskId => _taskId ?? '';
  bool hasTaskId() => _taskId != null;

  // "metadataJson" field.
  String? _metadataJson;
  String get metadataJson => _metadataJson ?? '';
  bool hasMetadataJson() => _metadataJson != null;

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
    _type = snapshotData['type'] as String?;
    _status = snapshotData['status'] as String?;
    _source = snapshotData['source'] as String?;
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _captureSessionId = snapshotData['captureSessionId'] as String?;
    _aiSessionId = snapshotData['aiSessionId'] as String?;
    _taskId = snapshotData['taskId'] as String?;
    _metadataJson = snapshotData['metadataJson'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inbox_items');

  static Stream<InboxItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InboxItemsRecord.fromSnapshot(s));

  static Future<InboxItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InboxItemsRecord.fromSnapshot(s));

  static InboxItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InboxItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InboxItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InboxItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InboxItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InboxItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInboxItemsRecordData({
  String? userId,
  String? type,
  String? status,
  String? source,
  String? title,
  String? text,
  String? captureSessionId,
  String? aiSessionId,
  String? taskId,
  String? metadataJson,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'type': type,
      'status': status,
      'source': source,
      'title': title,
      'text': text,
      'captureSessionId': captureSessionId,
      'aiSessionId': aiSessionId,
      'taskId': taskId,
      'metadataJson': metadataJson,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class InboxItemsRecordDocumentEquality implements Equality<InboxItemsRecord> {
  const InboxItemsRecordDocumentEquality();

  @override
  bool equals(InboxItemsRecord? e1, InboxItemsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.type == e2?.type &&
        e1?.status == e2?.status &&
        e1?.source == e2?.source &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.captureSessionId == e2?.captureSessionId &&
        e1?.aiSessionId == e2?.aiSessionId &&
        e1?.taskId == e2?.taskId &&
        e1?.metadataJson == e2?.metadataJson &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(InboxItemsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.type,
        e?.status,
        e?.source,
        e?.title,
        e?.text,
        e?.captureSessionId,
        e?.aiSessionId,
        e?.taskId,
        e?.metadataJson,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is InboxItemsRecord;
}

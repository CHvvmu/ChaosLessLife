import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "channel" field.
  String? _channel;
  String get channel => _channel ?? '';
  bool hasChannel() => _channel != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "aiDraft" field.
  String? _aiDraft;
  String get aiDraft => _aiDraft ?? '';
  bool hasAiDraft() => _aiDraft != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "threadId" field.
  String? _threadId;
  String get threadId => _threadId ?? '';
  bool hasThreadId() => _threadId != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _channel = snapshotData['channel'] as String?;
    _author = snapshotData['author'] as String?;
    _text = snapshotData['text'] as String?;
    _aiDraft = snapshotData['aiDraft'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _threadId = snapshotData['threadId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? userId,
  String? channel,
  String? author,
  String? text,
  String? aiDraft,
  DateTime? timestamp,
  String? threadId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'channel': channel,
      'author': author,
      'text': text,
      'aiDraft': aiDraft,
      'timestamp': timestamp,
      'threadId': threadId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.channel == e2?.channel &&
        e1?.author == e2?.author &&
        e1?.text == e2?.text &&
        e1?.aiDraft == e2?.aiDraft &&
        e1?.timestamp == e2?.timestamp &&
        e1?.threadId == e2?.threadId;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.channel,
        e?.author,
        e?.text,
        e?.aiDraft,
        e?.timestamp,
        e?.threadId
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}

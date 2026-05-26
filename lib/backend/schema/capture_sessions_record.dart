import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Коллекция DSL capture_sessions
class CaptureSessionsRecord extends FirestoreRecord {
  CaptureSessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "sourceType" field.
  String? _sourceType;
  String get sourceType => _sourceType ?? '';
  bool hasSourceType() => _sourceType != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "audioUrl" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "durationSec" field.
  int? _durationSec;
  int get durationSec => _durationSec ?? 0;
  bool hasDurationSec() => _durationSec != null;

  // "transcript" field.
  String? _transcript;
  String get transcript => _transcript ?? '';
  bool hasTranscript() => _transcript != null;

  // "aiSessionId" field.
  String? _aiSessionId;
  String get aiSessionId => _aiSessionId ?? '';
  bool hasAiSessionId() => _aiSessionId != null;

  // "inboxItemId" field.
  String? _inboxItemId;
  String get inboxItemId => _inboxItemId ?? '';
  bool hasInboxItemId() => _inboxItemId != null;

  // "errorMessage" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  bool hasErrorMessage() => _errorMessage != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "processedAt" field.
  DateTime? _processedAt;
  DateTime? get processedAt => _processedAt;
  bool hasProcessedAt() => _processedAt != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _sourceType = snapshotData['sourceType'] as String?;
    _status = snapshotData['status'] as String?;
    _audioUrl = snapshotData['audioUrl'] as String?;
    _text = snapshotData['text'] as String?;
    _durationSec = castToType<int>(snapshotData['durationSec']);
    _transcript = snapshotData['transcript'] as String?;
    _aiSessionId = snapshotData['aiSessionId'] as String?;
    _inboxItemId = snapshotData['inboxItemId'] as String?;
    _errorMessage = snapshotData['errorMessage'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _processedAt = snapshotData['processedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('capture_sessions');

  static Stream<CaptureSessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CaptureSessionsRecord.fromSnapshot(s));

  static Future<CaptureSessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CaptureSessionsRecord.fromSnapshot(s));

  static CaptureSessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CaptureSessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CaptureSessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CaptureSessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CaptureSessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CaptureSessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCaptureSessionsRecordData({
  String? userId,
  String? sourceType,
  String? status,
  String? audioUrl,
  String? text,
  int? durationSec,
  String? transcript,
  String? aiSessionId,
  String? inboxItemId,
  String? errorMessage,
  DateTime? createdAt,
  DateTime? processedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'sourceType': sourceType,
      'status': status,
      'audioUrl': audioUrl,
      'text': text,
      'durationSec': durationSec,
      'transcript': transcript,
      'aiSessionId': aiSessionId,
      'inboxItemId': inboxItemId,
      'errorMessage': errorMessage,
      'createdAt': createdAt,
      'processedAt': processedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CaptureSessionsRecordDocumentEquality
    implements Equality<CaptureSessionsRecord> {
  const CaptureSessionsRecordDocumentEquality();

  @override
  bool equals(CaptureSessionsRecord? e1, CaptureSessionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.sourceType == e2?.sourceType &&
        e1?.status == e2?.status &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.text == e2?.text &&
        e1?.durationSec == e2?.durationSec &&
        e1?.transcript == e2?.transcript &&
        e1?.aiSessionId == e2?.aiSessionId &&
        e1?.inboxItemId == e2?.inboxItemId &&
        e1?.errorMessage == e2?.errorMessage &&
        e1?.createdAt == e2?.createdAt &&
        e1?.processedAt == e2?.processedAt;
  }

  @override
  int hash(CaptureSessionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.sourceType,
        e?.status,
        e?.audioUrl,
        e?.text,
        e?.durationSec,
        e?.transcript,
        e?.aiSessionId,
        e?.inboxItemId,
        e?.errorMessage,
        e?.createdAt,
        e?.processedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is CaptureSessionsRecord;
}

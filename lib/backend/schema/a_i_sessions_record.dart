import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AISessionsRecord extends FirestoreRecord {
  AISessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  bool hasMode() => _mode != null;

  // "startedAt" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  bool hasStartedAt() => _startedAt != null;

  // "contextSummary" field.
  String? _contextSummary;
  String get contextSummary => _contextSummary ?? '';
  bool hasContextSummary() => _contextSummary != null;

  // "tokenUsage" field.
  int? _tokenUsage;
  int get tokenUsage => _tokenUsage ?? 0;
  bool hasTokenUsage() => _tokenUsage != null;

  // "costUsd" field.
  double? _costUsd;
  double get costUsd => _costUsd ?? 0.0;
  bool hasCostUsd() => _costUsd != null;

  // "expiresAt" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  bool hasExpiresAt() => _expiresAt != null;

  // "audioUrl" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "durationSec" field.
  int? _durationSec;
  int get durationSec => _durationSec ?? 0;
  bool hasDurationSec() => _durationSec != null;

  // "status" field.
  String? _status;

  /// status будет: recorded, transcribing, processed, error
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "transcript" field.
  String? _transcript;
  String get transcript => _transcript ?? '';
  bool hasTranscript() => _transcript != null;

  // "errorMessage" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  bool hasErrorMessage() => _errorMessage != null;

  // "processedAt" field.
  DateTime? _processedAt;
  DateTime? get processedAt => _processedAt;
  bool hasProcessedAt() => _processedAt != null;

  // "aiStatus" field.
  String? _aiStatus;

  /// Варианты: "extracting",  "completed", "error"
  String get aiStatus => _aiStatus ?? '';
  bool hasAiStatus() => _aiStatus != null;

  // "aiError" field.
  String? _aiError;
  String get aiError => _aiError ?? '';
  bool hasAiError() => _aiError != null;

  // "intent" field.
  String? _intent;
  String get intent => _intent ?? '';
  bool hasIntent() => _intent != null;

  // "intentStatus" field.
  String? _intentStatus;
  String get intentStatus => _intentStatus ?? '';
  bool hasIntentStatus() => _intentStatus != null;

  // "routeStatus" field.
  String? _routeStatus;
  String get routeStatus => _routeStatus ?? '';
  bool hasRouteStatus() => _routeStatus != null;

  // "tasksSublds" field.
  String? _tasksSublds;
  String get tasksSublds => _tasksSublds ?? '';
  bool hasTasksSublds() => _tasksSublds != null;

  // "tasksIds" field.
  String? _tasksIds;
  String get tasksIds => _tasksIds ?? '';
  bool hasTasksIds() => _tasksIds != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _mode = snapshotData['mode'] as String?;
    _startedAt = snapshotData['startedAt'] as DateTime?;
    _contextSummary = snapshotData['contextSummary'] as String?;
    _tokenUsage = castToType<int>(snapshotData['tokenUsage']);
    _costUsd = castToType<double>(snapshotData['costUsd']);
    _expiresAt = snapshotData['expiresAt'] as DateTime?;
    _audioUrl = snapshotData['audioUrl'] as String?;
    _durationSec = castToType<int>(snapshotData['durationSec']);
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _transcript = snapshotData['transcript'] as String?;
    _errorMessage = snapshotData['errorMessage'] as String?;
    _processedAt = snapshotData['processedAt'] as DateTime?;
    _aiStatus = snapshotData['aiStatus'] as String?;
    _aiError = snapshotData['aiError'] as String?;
    _intent = snapshotData['intent'] as String?;
    _intentStatus = snapshotData['intentStatus'] as String?;
    _routeStatus = snapshotData['routeStatus'] as String?;
    _tasksSublds = snapshotData['tasksSublds'] as String?;
    _tasksIds = snapshotData['tasksIds'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AI_sessions');

  static Stream<AISessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AISessionsRecord.fromSnapshot(s));

  static Future<AISessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AISessionsRecord.fromSnapshot(s));

  static AISessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AISessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AISessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AISessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AISessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AISessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAISessionsRecordData({
  String? userId,
  String? mode,
  DateTime? startedAt,
  String? contextSummary,
  int? tokenUsage,
  double? costUsd,
  DateTime? expiresAt,
  String? audioUrl,
  int? durationSec,
  String? status,
  DateTime? createdAt,
  String? transcript,
  String? errorMessage,
  DateTime? processedAt,
  String? aiStatus,
  String? aiError,
  String? intent,
  String? intentStatus,
  String? routeStatus,
  String? tasksSublds,
  String? tasksIds,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'mode': mode,
      'startedAt': startedAt,
      'contextSummary': contextSummary,
      'tokenUsage': tokenUsage,
      'costUsd': costUsd,
      'expiresAt': expiresAt,
      'audioUrl': audioUrl,
      'durationSec': durationSec,
      'status': status,
      'createdAt': createdAt,
      'transcript': transcript,
      'errorMessage': errorMessage,
      'processedAt': processedAt,
      'aiStatus': aiStatus,
      'aiError': aiError,
      'intent': intent,
      'intentStatus': intentStatus,
      'routeStatus': routeStatus,
      'tasksSublds': tasksSublds,
      'tasksIds': tasksIds,
    }.withoutNulls,
  );

  return firestoreData;
}

class AISessionsRecordDocumentEquality implements Equality<AISessionsRecord> {
  const AISessionsRecordDocumentEquality();

  @override
  bool equals(AISessionsRecord? e1, AISessionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.mode == e2?.mode &&
        e1?.startedAt == e2?.startedAt &&
        e1?.contextSummary == e2?.contextSummary &&
        e1?.tokenUsage == e2?.tokenUsage &&
        e1?.costUsd == e2?.costUsd &&
        e1?.expiresAt == e2?.expiresAt &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.durationSec == e2?.durationSec &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.transcript == e2?.transcript &&
        e1?.errorMessage == e2?.errorMessage &&
        e1?.processedAt == e2?.processedAt &&
        e1?.aiStatus == e2?.aiStatus &&
        e1?.aiError == e2?.aiError &&
        e1?.intent == e2?.intent &&
        e1?.intentStatus == e2?.intentStatus &&
        e1?.routeStatus == e2?.routeStatus &&
        e1?.tasksSublds == e2?.tasksSublds &&
        e1?.tasksIds == e2?.tasksIds;
  }

  @override
  int hash(AISessionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.mode,
        e?.startedAt,
        e?.contextSummary,
        e?.tokenUsage,
        e?.costUsd,
        e?.expiresAt,
        e?.audioUrl,
        e?.durationSec,
        e?.status,
        e?.createdAt,
        e?.transcript,
        e?.errorMessage,
        e?.processedAt,
        e?.aiStatus,
        e?.aiError,
        e?.intent,
        e?.intentStatus,
        e?.routeStatus,
        e?.tasksSublds,
        e?.tasksIds
      ]);

  @override
  bool isValidKey(Object? o) => o is AISessionsRecord;
}

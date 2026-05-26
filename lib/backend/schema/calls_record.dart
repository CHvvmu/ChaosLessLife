import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallsRecord extends FirestoreRecord {
  CallsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "startedAt" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  bool hasStartedAt() => _startedAt != null;

  // "durationSec" field.
  int? _durationSec;
  int get durationSec => _durationSec ?? 0;
  bool hasDurationSec() => _durationSec != null;

  // "moodScore" field.
  double? _moodScore;
  double get moodScore => _moodScore ?? 0.0;
  bool hasMoodScore() => _moodScore != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "transcriptUrl" field.
  String? _transcriptUrl;
  String get transcriptUrl => _transcriptUrl ?? '';
  bool hasTranscriptUrl() => _transcriptUrl != null;

  // "audioUrl" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "aiParticipationRate" field.
  double? _aiParticipationRate;
  double get aiParticipationRate => _aiParticipationRate ?? 0.0;
  bool hasAiParticipationRate() => _aiParticipationRate != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _startedAt = snapshotData['startedAt'] as DateTime?;
    _durationSec = castToType<int>(snapshotData['durationSec']);
    _moodScore = castToType<double>(snapshotData['moodScore']);
    _summary = snapshotData['summary'] as String?;
    _transcriptUrl = snapshotData['transcriptUrl'] as String?;
    _audioUrl = snapshotData['audioUrl'] as String?;
    _aiParticipationRate =
        castToType<double>(snapshotData['aiParticipationRate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Calls');

  static Stream<CallsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CallsRecord.fromSnapshot(s));

  static Future<CallsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CallsRecord.fromSnapshot(s));

  static CallsRecord fromSnapshot(DocumentSnapshot snapshot) => CallsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CallsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CallsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CallsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CallsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCallsRecordData({
  String? userId,
  DateTime? startedAt,
  int? durationSec,
  double? moodScore,
  String? summary,
  String? transcriptUrl,
  String? audioUrl,
  double? aiParticipationRate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'startedAt': startedAt,
      'durationSec': durationSec,
      'moodScore': moodScore,
      'summary': summary,
      'transcriptUrl': transcriptUrl,
      'audioUrl': audioUrl,
      'aiParticipationRate': aiParticipationRate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CallsRecordDocumentEquality implements Equality<CallsRecord> {
  const CallsRecordDocumentEquality();

  @override
  bool equals(CallsRecord? e1, CallsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.startedAt == e2?.startedAt &&
        e1?.durationSec == e2?.durationSec &&
        e1?.moodScore == e2?.moodScore &&
        e1?.summary == e2?.summary &&
        e1?.transcriptUrl == e2?.transcriptUrl &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.aiParticipationRate == e2?.aiParticipationRate;
  }

  @override
  int hash(CallsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.startedAt,
        e?.durationSec,
        e?.moodScore,
        e?.summary,
        e?.transcriptUrl,
        e?.audioUrl,
        e?.aiParticipationRate
      ]);

  @override
  bool isValidKey(Object? o) => o is CallsRecord;
}

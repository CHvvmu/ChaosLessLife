import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalyticsDailyRecord extends FirestoreRecord {
  AnalyticsDailyRecord._(
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

  // "tasksCompleted" field.
  int? _tasksCompleted;
  int get tasksCompleted => _tasksCompleted ?? 0;
  bool hasTasksCompleted() => _tasksCompleted != null;

  // "focusScore" field.
  double? _focusScore;
  double get focusScore => _focusScore ?? 0.0;
  bool hasFocusScore() => _focusScore != null;

  // "stressScore" field.
  double? _stressScore;
  double get stressScore => _stressScore ?? 0.0;
  bool hasStressScore() => _stressScore != null;

  // "moodScore" field.
  double? _moodScore;
  double get moodScore => _moodScore ?? 0.0;
  bool hasMoodScore() => _moodScore != null;

  // "callsCount" field.
  int? _callsCount;
  int get callsCount => _callsCount ?? 0;
  bool hasCallsCount() => _callsCount != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _tasksCompleted = castToType<int>(snapshotData['tasksCompleted']);
    _focusScore = castToType<double>(snapshotData['focusScore']);
    _stressScore = castToType<double>(snapshotData['stressScore']);
    _moodScore = castToType<double>(snapshotData['moodScore']);
    _callsCount = castToType<int>(snapshotData['callsCount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Analytics_daily');

  static Stream<AnalyticsDailyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnalyticsDailyRecord.fromSnapshot(s));

  static Future<AnalyticsDailyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnalyticsDailyRecord.fromSnapshot(s));

  static AnalyticsDailyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnalyticsDailyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnalyticsDailyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnalyticsDailyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnalyticsDailyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnalyticsDailyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnalyticsDailyRecordData({
  String? userId,
  DateTime? date,
  int? tasksCompleted,
  double? focusScore,
  double? stressScore,
  double? moodScore,
  int? callsCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'date': date,
      'tasksCompleted': tasksCompleted,
      'focusScore': focusScore,
      'stressScore': stressScore,
      'moodScore': moodScore,
      'callsCount': callsCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnalyticsDailyRecordDocumentEquality
    implements Equality<AnalyticsDailyRecord> {
  const AnalyticsDailyRecordDocumentEquality();

  @override
  bool equals(AnalyticsDailyRecord? e1, AnalyticsDailyRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.date == e2?.date &&
        e1?.tasksCompleted == e2?.tasksCompleted &&
        e1?.focusScore == e2?.focusScore &&
        e1?.stressScore == e2?.stressScore &&
        e1?.moodScore == e2?.moodScore &&
        e1?.callsCount == e2?.callsCount;
  }

  @override
  int hash(AnalyticsDailyRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.date,
        e?.tasksCompleted,
        e?.focusScore,
        e?.stressScore,
        e?.moodScore,
        e?.callsCount
      ]);

  @override
  bool isValidKey(Object? o) => o is AnalyticsDailyRecord;
}

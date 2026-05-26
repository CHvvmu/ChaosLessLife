import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Временный Полный текст звонка
class CallRawTranscriptsRecord extends FirestoreRecord {
  CallRawTranscriptsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "callId" field.
  String? _callId;
  String get callId => _callId ?? '';
  bool hasCallId() => _callId != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "segments" field.
  List<CallSegmentsStruct>? _segments;
  List<CallSegmentsStruct> get segments => _segments ?? const [];
  bool hasSegments() => _segments != null;

  // "fullText" field.
  String? _fullText;
  String get fullText => _fullText ?? '';
  bool hasFullText() => _fullText != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _callId = snapshotData['callId'] as String?;
    _userId = snapshotData['userId'] as String?;
    _language = snapshotData['language'] as String?;
    _segments = getStructList(
      snapshotData['segments'],
      CallSegmentsStruct.fromMap,
    );
    _fullText = snapshotData['fullText'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Call_raw_transcripts');

  static Stream<CallRawTranscriptsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CallRawTranscriptsRecord.fromSnapshot(s));

  static Future<CallRawTranscriptsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CallRawTranscriptsRecord.fromSnapshot(s));

  static CallRawTranscriptsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CallRawTranscriptsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CallRawTranscriptsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CallRawTranscriptsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CallRawTranscriptsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CallRawTranscriptsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCallRawTranscriptsRecordData({
  String? callId,
  String? userId,
  String? language,
  String? fullText,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'callId': callId,
      'userId': userId,
      'language': language,
      'fullText': fullText,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CallRawTranscriptsRecordDocumentEquality
    implements Equality<CallRawTranscriptsRecord> {
  const CallRawTranscriptsRecordDocumentEquality();

  @override
  bool equals(CallRawTranscriptsRecord? e1, CallRawTranscriptsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.callId == e2?.callId &&
        e1?.userId == e2?.userId &&
        e1?.language == e2?.language &&
        listEquality.equals(e1?.segments, e2?.segments) &&
        e1?.fullText == e2?.fullText &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(CallRawTranscriptsRecord? e) => const ListEquality().hash([
        e?.callId,
        e?.userId,
        e?.language,
        e?.segments,
        e?.fullText,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is CallRawTranscriptsRecord;
}

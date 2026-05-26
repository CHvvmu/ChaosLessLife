import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegrationsRecord extends FirestoreRecord {
  IntegrationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "telegramConnected" field.
  bool? _telegramConnected;
  bool get telegramConnected => _telegramConnected ?? false;
  bool hasTelegramConnected() => _telegramConnected != null;

  // "bitrixConnected" field.
  bool? _bitrixConnected;
  bool get bitrixConnected => _bitrixConnected ?? false;
  bool hasBitrixConnected() => _bitrixConnected != null;

  // "googleCalendarConnected" field.
  bool? _googleCalendarConnected;
  bool get googleCalendarConnected => _googleCalendarConnected ?? false;
  bool hasGoogleCalendarConnected() => _googleCalendarConnected != null;

  void _initializeFields() {
    _telegramConnected = snapshotData['telegramConnected'] as bool?;
    _bitrixConnected = snapshotData['bitrixConnected'] as bool?;
    _googleCalendarConnected = snapshotData['googleCalendarConnected'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Integrations');

  static Stream<IntegrationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IntegrationsRecord.fromSnapshot(s));

  static Future<IntegrationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IntegrationsRecord.fromSnapshot(s));

  static IntegrationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IntegrationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IntegrationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IntegrationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IntegrationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IntegrationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIntegrationsRecordData({
  bool? telegramConnected,
  bool? bitrixConnected,
  bool? googleCalendarConnected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'telegramConnected': telegramConnected,
      'bitrixConnected': bitrixConnected,
      'googleCalendarConnected': googleCalendarConnected,
    }.withoutNulls,
  );

  return firestoreData;
}

class IntegrationsRecordDocumentEquality
    implements Equality<IntegrationsRecord> {
  const IntegrationsRecordDocumentEquality();

  @override
  bool equals(IntegrationsRecord? e1, IntegrationsRecord? e2) {
    return e1?.telegramConnected == e2?.telegramConnected &&
        e1?.bitrixConnected == e2?.bitrixConnected &&
        e1?.googleCalendarConnected == e2?.googleCalendarConnected;
  }

  @override
  int hash(IntegrationsRecord? e) => const ListEquality().hash(
      [e?.telegramConnected, e?.bitrixConnected, e?.googleCalendarConnected]);

  @override
  bool isValidKey(Object? o) => o is IntegrationsRecord;
}

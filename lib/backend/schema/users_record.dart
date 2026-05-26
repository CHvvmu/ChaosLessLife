import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "pinHash" field.
  String? _pinHash;
  String get pinHash => _pinHash ?? '';
  bool hasPinHash() => _pinHash != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "assistantVoice" field.
  String? _assistantVoice;
  String get assistantVoice => _assistantVoice ?? '';
  bool hasAssistantVoice() => _assistantVoice != null;

  // "aiMode" field.
  String? _aiMode;
  String get aiMode => _aiMode ?? '';
  bool hasAiMode() => _aiMode != null;

  // "lastLoginAt" field.
  DateTime? _lastLoginAt;
  DateTime? get lastLoginAt => _lastLoginAt;
  bool hasLastLoginAt() => _lastLoginAt != null;

  // "workStartHour" field.
  int? _workStartHour;
  int get workStartHour => _workStartHour ?? 0;
  bool hasWorkStartHour() => _workStartHour != null;

  // "workEndHour" field.
  int? _workEndHour;
  int get workEndHour => _workEndHour ?? 0;
  bool hasWorkEndHour() => _workEndHour != null;

  // "maxDeepWorkHours" field.
  int? _maxDeepWorkHours;
  int get maxDeepWorkHours => _maxDeepWorkHours ?? 0;
  bool hasMaxDeepWorkHours() => _maxDeepWorkHours != null;

  // "timezone" field.
  String? _timezone;
  String get timezone => _timezone ?? '';
  bool hasTimezone() => _timezone != null;

  // "autoApplyScheduling" field.
  bool? _autoApplyScheduling;
  bool get autoApplyScheduling => _autoApplyScheduling ?? false;
  bool hasAutoApplyScheduling() => _autoApplyScheduling != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _pinHash = snapshotData['pinHash'] as String?;
    _language = snapshotData['language'] as String?;
    _assistantVoice = snapshotData['assistantVoice'] as String?;
    _aiMode = snapshotData['aiMode'] as String?;
    _lastLoginAt = snapshotData['lastLoginAt'] as DateTime?;
    _workStartHour = castToType<int>(snapshotData['workStartHour']);
    _workEndHour = castToType<int>(snapshotData['workEndHour']);
    _maxDeepWorkHours = castToType<int>(snapshotData['maxDeepWorkHours']);
    _timezone = snapshotData['timezone'] as String?;
    _autoApplyScheduling = snapshotData['autoApplyScheduling'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? pinHash,
  String? language,
  String? assistantVoice,
  String? aiMode,
  DateTime? lastLoginAt,
  int? workStartHour,
  int? workEndHour,
  int? maxDeepWorkHours,
  String? timezone,
  bool? autoApplyScheduling,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'pinHash': pinHash,
      'language': language,
      'assistantVoice': assistantVoice,
      'aiMode': aiMode,
      'lastLoginAt': lastLoginAt,
      'workStartHour': workStartHour,
      'workEndHour': workEndHour,
      'maxDeepWorkHours': maxDeepWorkHours,
      'timezone': timezone,
      'autoApplyScheduling': autoApplyScheduling,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.pinHash == e2?.pinHash &&
        e1?.language == e2?.language &&
        e1?.assistantVoice == e2?.assistantVoice &&
        e1?.aiMode == e2?.aiMode &&
        e1?.lastLoginAt == e2?.lastLoginAt &&
        e1?.workStartHour == e2?.workStartHour &&
        e1?.workEndHour == e2?.workEndHour &&
        e1?.maxDeepWorkHours == e2?.maxDeepWorkHours &&
        e1?.timezone == e2?.timezone &&
        e1?.autoApplyScheduling == e2?.autoApplyScheduling;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.pinHash,
        e?.language,
        e?.assistantVoice,
        e?.aiMode,
        e?.lastLoginAt,
        e?.workStartHour,
        e?.workEndHour,
        e?.maxDeepWorkHours,
        e?.timezone,
        e?.autoApplyScheduling
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}

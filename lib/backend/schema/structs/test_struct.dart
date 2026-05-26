// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Тестовые данные
class TestStruct extends FFFirebaseStruct {
  TestStruct({
    int? id,
    String? name,
    String? photo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _photo = photo,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;

  bool hasPhoto() => _photo != null;

  static TestStruct fromMap(Map<String, dynamic> data) => TestStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        photo: data['photo'] as String?,
      );

  static TestStruct? maybeFromMap(dynamic data) =>
      data is Map ? TestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'photo': _photo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestStruct &&
        id == other.id &&
        name == other.name &&
        photo == other.photo;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, photo]);
}

TestStruct createTestStruct({
  int? id,
  String? name,
  String? photo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestStruct(
      id: id,
      name: name,
      photo: photo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestStruct? updateTestStruct(
  TestStruct? test, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    test
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestStructData(
  Map<String, dynamic> firestoreData,
  TestStruct? test,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (test == null) {
    return;
  }
  if (test.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && test.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testData = getTestFirestoreData(test, forFieldValue);
  final nestedData = testData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = test.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestFirestoreData(
  TestStruct? test, [
  bool forFieldValue = false,
]) {
  if (test == null) {
    return {};
  }
  final firestoreData = mapToFirestore(test.toMap());

  // Add any Firestore field values
  mapToFirestore(test.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestListFirestoreData(
  List<TestStruct>? tests,
) =>
    tests?.map((e) => getTestFirestoreData(e, true)).toList() ?? [];

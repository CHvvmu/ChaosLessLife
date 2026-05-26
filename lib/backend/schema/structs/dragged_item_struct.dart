// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Перетаскиваемые элементы
class DraggedItemStruct extends FFFirebaseStruct {
  DraggedItemStruct({
    String? id,
    int? order,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _order = order,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  static DraggedItemStruct fromMap(Map<String, dynamic> data) =>
      DraggedItemStruct(
        id: data['id'] as String?,
        order: castToType<int>(data['order']),
      );

  static DraggedItemStruct? maybeFromMap(dynamic data) => data is Map
      ? DraggedItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'order': _order,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
      }.withoutNulls;

  static DraggedItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      DraggedItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DraggedItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DraggedItemStruct && id == other.id && order == other.order;
  }

  @override
  int get hashCode => const ListEquality().hash([id, order]);
}

DraggedItemStruct createDraggedItemStruct({
  String? id,
  int? order,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DraggedItemStruct(
      id: id,
      order: order,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DraggedItemStruct? updateDraggedItemStruct(
  DraggedItemStruct? draggedItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    draggedItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDraggedItemStructData(
  Map<String, dynamic> firestoreData,
  DraggedItemStruct? draggedItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (draggedItem == null) {
    return;
  }
  if (draggedItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && draggedItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final draggedItemData =
      getDraggedItemFirestoreData(draggedItem, forFieldValue);
  final nestedData =
      draggedItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = draggedItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDraggedItemFirestoreData(
  DraggedItemStruct? draggedItem, [
  bool forFieldValue = false,
]) {
  if (draggedItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(draggedItem.toMap());

  // Add any Firestore field values
  mapToFirestore(draggedItem.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDraggedItemListFirestoreData(
  List<DraggedItemStruct>? draggedItems,
) =>
    draggedItems?.map((e) => getDraggedItemFirestoreData(e, true)).toList() ??
    [];

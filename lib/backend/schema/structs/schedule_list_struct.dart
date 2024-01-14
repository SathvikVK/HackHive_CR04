// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleListStruct extends FFFirebaseStruct {
  ScheduleListStruct({
    List<String>? scheduleField,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _scheduleField = scheduleField,
        super(firestoreUtilData);

  // "scheduleField" field.
  List<String>? _scheduleField;
  List<String> get scheduleField => _scheduleField ?? const [];
  set scheduleField(List<String>? val) => _scheduleField = val;
  void updateScheduleField(Function(List<String>) updateFn) =>
      updateFn(_scheduleField ??= []);
  bool hasScheduleField() => _scheduleField != null;

  static ScheduleListStruct fromMap(Map<String, dynamic> data) =>
      ScheduleListStruct(
        scheduleField: getDataList(data['scheduleField']),
      );

  static ScheduleListStruct? maybeFromMap(dynamic data) => data is Map
      ? ScheduleListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'scheduleField': _scheduleField,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'scheduleField': serializeParam(
          _scheduleField,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static ScheduleListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScheduleListStruct(
        scheduleField: deserializeParam<String>(
          data['scheduleField'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ScheduleListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ScheduleListStruct &&
        listEquality.equals(scheduleField, other.scheduleField);
  }

  @override
  int get hashCode => const ListEquality().hash([scheduleField]);
}

ScheduleListStruct createScheduleListStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScheduleListStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScheduleListStruct? updateScheduleListStruct(
  ScheduleListStruct? scheduleList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    scheduleList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScheduleListStructData(
  Map<String, dynamic> firestoreData,
  ScheduleListStruct? scheduleList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (scheduleList == null) {
    return;
  }
  if (scheduleList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && scheduleList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scheduleListData =
      getScheduleListFirestoreData(scheduleList, forFieldValue);
  final nestedData =
      scheduleListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = scheduleList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScheduleListFirestoreData(
  ScheduleListStruct? scheduleList, [
  bool forFieldValue = false,
]) {
  if (scheduleList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(scheduleList.toMap());

  // Add any Firestore field values
  scheduleList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScheduleListListFirestoreData(
  List<ScheduleListStruct>? scheduleLists,
) =>
    scheduleLists?.map((e) => getScheduleListFirestoreData(e, true)).toList() ??
    [];

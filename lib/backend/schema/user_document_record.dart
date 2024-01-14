import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDocumentRecord extends FirestoreRecord {
  UserDocumentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email_id" field.
  String? _emailId;
  String get emailId => _emailId ?? '';
  bool hasEmailId() => _emailId != null;

  // "preferences" field.
  List<String>? _preferences;
  List<String> get preferences => _preferences ?? const [];
  bool hasPreferences() => _preferences != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "puchase" field.
  double? _puchase;
  double get puchase => _puchase ?? 0.0;
  bool hasPuchase() => _puchase != null;

  // "rewards" field.
  int? _rewards;
  int get rewards => _rewards ?? 0;
  bool hasRewards() => _rewards != null;

  void _initializeFields() {
    _emailId = snapshotData['email_id'] as String?;
    _preferences = getDataList(snapshotData['preferences']);
    _name = snapshotData['name'] as String?;
    _puchase = castToType<double>(snapshotData['puchase']);
    _rewards = castToType<int>(snapshotData['rewards']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userDocument');

  static Stream<UserDocumentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDocumentRecord.fromSnapshot(s));

  static Future<UserDocumentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDocumentRecord.fromSnapshot(s));

  static UserDocumentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDocumentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDocumentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDocumentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDocumentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDocumentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDocumentRecordData({
  String? emailId,
  String? name,
  double? puchase,
  int? rewards,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email_id': emailId,
      'name': name,
      'puchase': puchase,
      'rewards': rewards,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDocumentRecordDocumentEquality
    implements Equality<UserDocumentRecord> {
  const UserDocumentRecordDocumentEquality();

  @override
  bool equals(UserDocumentRecord? e1, UserDocumentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.emailId == e2?.emailId &&
        listEquality.equals(e1?.preferences, e2?.preferences) &&
        e1?.name == e2?.name &&
        e1?.puchase == e2?.puchase &&
        e1?.rewards == e2?.rewards;
  }

  @override
  int hash(UserDocumentRecord? e) => const ListEquality()
      .hash([e?.emailId, e?.preferences, e?.name, e?.puchase, e?.rewards]);

  @override
  bool isValidKey(Object? o) => o is UserDocumentRecord;
}

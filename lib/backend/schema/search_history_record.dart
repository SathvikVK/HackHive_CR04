import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SearchHistoryRecord extends FirestoreRecord {
  SearchHistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "emailID" field.
  String? _emailID;
  String get emailID => _emailID ?? '';
  bool hasEmailID() => _emailID != null;

  // "searchKey" field.
  String? _searchKey;
  String get searchKey => _searchKey ?? '';
  bool hasSearchKey() => _searchKey != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  void _initializeFields() {
    _emailID = snapshotData['emailID'] as String?;
    _searchKey = snapshotData['searchKey'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('searchHistory');

  static Stream<SearchHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SearchHistoryRecord.fromSnapshot(s));

  static Future<SearchHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SearchHistoryRecord.fromSnapshot(s));

  static SearchHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SearchHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SearchHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SearchHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SearchHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SearchHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSearchHistoryRecordData({
  String? emailID,
  String? searchKey,
  DateTime? dateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'emailID': emailID,
      'searchKey': searchKey,
      'dateTime': dateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SearchHistoryRecordDocumentEquality
    implements Equality<SearchHistoryRecord> {
  const SearchHistoryRecordDocumentEquality();

  @override
  bool equals(SearchHistoryRecord? e1, SearchHistoryRecord? e2) {
    return e1?.emailID == e2?.emailID &&
        e1?.searchKey == e2?.searchKey &&
        e1?.dateTime == e2?.dateTime;
  }

  @override
  int hash(SearchHistoryRecord? e) =>
      const ListEquality().hash([e?.emailID, e?.searchKey, e?.dateTime]);

  @override
  bool isValidKey(Object? o) => o is SearchHistoryRecord;
}

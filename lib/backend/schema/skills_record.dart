import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillsRecord extends FirestoreRecord {
  SkillsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  bool hasLevel() => _level != null;

  // "given_by" field.
  DocumentReference? _givenBy;
  DocumentReference? get givenBy => _givenBy;
  bool hasGivenBy() => _givenBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _level = snapshotData['level'] as String?;
    _givenBy = snapshotData['given_by'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('skills')
          : FirebaseFirestore.instance.collectionGroup('skills');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('skills').doc(id);

  static Stream<SkillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SkillsRecord.fromSnapshot(s));

  static Future<SkillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SkillsRecord.fromSnapshot(s));

  static SkillsRecord fromSnapshot(DocumentSnapshot snapshot) => SkillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SkillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SkillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SkillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SkillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSkillsRecordData({
  String? name,
  String? level,
  DocumentReference? givenBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'level': level,
      'given_by': givenBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class SkillsRecordDocumentEquality implements Equality<SkillsRecord> {
  const SkillsRecordDocumentEquality();

  @override
  bool equals(SkillsRecord? e1, SkillsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.level == e2?.level &&
        e1?.givenBy == e2?.givenBy;
  }

  @override
  int hash(SkillsRecord? e) =>
      const ListEquality().hash([e?.name, e?.level, e?.givenBy]);

  @override
  bool isValidKey(Object? o) => o is SkillsRecord;
}

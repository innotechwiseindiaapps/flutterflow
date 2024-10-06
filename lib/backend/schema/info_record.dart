import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InfoRecord extends FirestoreRecord {
  InfoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "skills" field.
  List<DocumentReference>? _skills;
  List<DocumentReference> get skills => _skills ?? const [];
  bool hasSkills() => _skills != null;

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  bool hasUniversity() => _university != null;

  // "grad_year" field.
  int? _gradYear;
  int get gradYear => _gradYear ?? 0;
  bool hasGradYear() => _gradYear != null;

  // "projects" field.
  List<String>? _projects;
  List<String> get projects => _projects ?? const [];
  bool hasProjects() => _projects != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _skills = getDataList(snapshotData['skills']);
    _university = snapshotData['university'] as String?;
    _gradYear = castToType<int>(snapshotData['grad_year']);
    _projects = getDataList(snapshotData['projects']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Info');

  static Stream<InfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InfoRecord.fromSnapshot(s));

  static Future<InfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InfoRecord.fromSnapshot(s));

  static InfoRecord fromSnapshot(DocumentSnapshot snapshot) => InfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInfoRecordData({
  String? name,
  String? university,
  int? gradYear,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'university': university,
      'grad_year': gradYear,
    }.withoutNulls,
  );

  return firestoreData;
}

class InfoRecordDocumentEquality implements Equality<InfoRecord> {
  const InfoRecordDocumentEquality();

  @override
  bool equals(InfoRecord? e1, InfoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.skills, e2?.skills) &&
        e1?.university == e2?.university &&
        e1?.gradYear == e2?.gradYear &&
        listEquality.equals(e1?.projects, e2?.projects);
  }

  @override
  int hash(InfoRecord? e) => const ListEquality()
      .hash([e?.name, e?.skills, e?.university, e?.gradYear, e?.projects]);

  @override
  bool isValidKey(Object? o) => o is InfoRecord;
}

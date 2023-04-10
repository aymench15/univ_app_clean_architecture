import '../../domain/entities/section.dart';

class SectionModel extends Section {
  const SectionModel(
      {required super.sectionn_id,
      required super.sectionn_name,
      required super.id_niv_spec,
      required super.capacite_sec,
      required super.Abrev_fr,
      required super.Abrev_ar,
      required super.active});

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
      sectionn_id: json["sectionn_id"],
      sectionn_name: json["sectionn_name"],
      id_niv_spec: json["id_niv_spec"],
      capacite_sec: json["capacite_sec"],
      Abrev_fr: json["Abrev_fr"],
      Abrev_ar: json["Abrev_ar"],
      active: json["active"]);
}

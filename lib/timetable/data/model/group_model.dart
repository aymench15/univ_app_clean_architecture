import '../../domain/entities/group.dart';

class GroupModel extends Group {
  const GroupModel(
      {required super.groupe_id,
      required super.groupe_name,
      required super.sectionn_id,
      required super.Abrev_fr,
      required super.Abrev_ar,
      required super.capacite_grp,
      required super.active});

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
      groupe_id: json["groupe_id"],
      groupe_name: json["groupe_name"],
      sectionn_id: json["sectionn_id"],
     Abrev_fr: json["Abrev_fr"],
      Abrev_ar: json["Abrev_ar"],
      capacite_grp: json["capacite_grp"],
      active: json["active"]);
}

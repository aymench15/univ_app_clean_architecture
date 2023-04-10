import '../../domain/entities/level.dart';

class LevelModel extends Level {
  const LevelModel({required super.id_niv_spec, required super.id_specialty, required super.id_niveau, required super.Actif, required super.active}
      );

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
      id_niv_spec: json["id_niv_spec"],
      id_specialty: json["id_specialty"],
      id_niveau: json["id_niveau"],
      Actif: json["Actif"],
      active: json["active"]);
}

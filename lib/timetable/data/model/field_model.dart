import '../../domain/entities/field.dart';

class FieldModel extends Field {
  const FieldModel({required super.id_specialty, required super.id_dep, required super.Nom_spec, required super.name_spec_ar, required super.AbrevFR, required super.AbrevAR, required super.active});

  factory FieldModel.fromJson(Map<String, dynamic> json) => FieldModel(
   id_specialty: json["id_specialty"] ,
   id_dep: json["id_dep"],
   Nom_spec: json["Nom_spec"],
    name_spec_ar: json["name_spec_ar"],
     AbrevFR: json["AbrevFR"],
      AbrevAR: json["AbrevAR"],
       active: json["active"]
  );
}
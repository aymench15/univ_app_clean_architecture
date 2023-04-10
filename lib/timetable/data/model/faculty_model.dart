import '../../domain/entities/faculty.dart';

class FacultyModel extends Faculty {
  const FacultyModel(
      {required super.id_fac,
      required super.name_fac,
      required super.name_fac_ar});

  factory FacultyModel.fromJson(Map<String, dynamic> json) => FacultyModel(
   id_fac: json["id_fac"] ,
   name_fac: json["name_fac"],
   name_fac_ar: json["name_fac_ar"]
  );
}
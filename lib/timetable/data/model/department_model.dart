import '../../domain/entities/department.dart';

class DepartmentModel extends Department {
  const DepartmentModel(
      {required super.id,
      required super.name_fr,
      required super.name_ar});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
   id: json["id"] ,
   name_fr: json["name_fr"],
   name_ar: json["name_ar"]
  );
}
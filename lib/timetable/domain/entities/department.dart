import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final String id;
  final String name_fr;
  final String name_ar;

  const Department(
      {required this.id,
      required this.name_fr,
      required this.name_ar});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name_fr, name_ar];
}
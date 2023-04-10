import 'package:equatable/equatable.dart';

class Faculty extends Equatable {
  final String id_fac;
  final String name_fac;
  final String name_fac_ar;

  const Faculty(
      {required this.id_fac,
      required this.name_fac,
      required this.name_fac_ar});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id_fac, name_fac, name_fac_ar];
}
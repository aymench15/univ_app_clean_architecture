import 'package:equatable/equatable.dart';

class Level extends Equatable {
  final String id_niv_spec;
  final String id_specialty;
  final String id_niveau;
  final String Actif;
  final String active;

  const Level({required this.id_niv_spec,required this.id_specialty,required this.id_niveau,required this.Actif,required this.active});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id_niv_spec,id_specialty,id_niveau,Actif,active
    ];
  }
}

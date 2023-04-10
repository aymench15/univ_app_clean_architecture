import 'package:equatable/equatable.dart';

class Field extends Equatable {
  final String id_specialty;
  final String id_dep;
  final String Nom_spec;
  final String name_spec_ar;
  final String AbrevFR;
  final String AbrevAR;
  final String active;

  const Field({required this.id_specialty,required this.id_dep,required this.Nom_spec,required this.name_spec_ar,
    required  this.AbrevFR,required this.AbrevAR,required this.active});

  @override
  // TODO: implement props
   List<Object?> get props {
    return [id_specialty, id_dep,Nom_spec, name_spec_ar,AbrevFR,AbrevAR,active];
  }
}

import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final String groupe_id;
  final String groupe_name;
  final String sectionn_id;
  final String Abrev_fr;
  final String Abrev_ar;
  final String capacite_grp;
  final String active;

  const Group({required this.groupe_id,required this.groupe_name,required this.sectionn_id,required this.Abrev_fr,
     required this.Abrev_ar,required this.capacite_grp,required this.active});

  @override
  List<Object?> get props {
    return [
      groupe_id,
      groupe_name,
      sectionn_id,
      Abrev_fr,
      Abrev_ar,
      capacite_grp,
      active
    ];
  }
}

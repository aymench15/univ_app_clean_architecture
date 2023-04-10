import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final String sectionn_id;
  final String sectionn_name;
  final String id_niv_spec;
  final String capacite_sec;
  final String Abrev_fr;
  final String Abrev_ar;
  final String active;

  const Section({required this.sectionn_id,required this.sectionn_name,required this.id_niv_spec,
     required this.capacite_sec,required this.Abrev_fr,required this.Abrev_ar,required this.active});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      sectionn_id,
      sectionn_name,
      id_niv_spec,
      capacite_sec,
      Abrev_fr,
      Abrev_ar,
      active
    ];
  }
}

import 'package:equatable/equatable.dart';

abstract class DataEvents extends Equatable {
  const DataEvents();
}

class FacultyEvents extends DataEvents {
  @override
  List<Object?> get props => [];
}

class DepartmentEvent extends DataEvents {
  final String id;
  const DepartmentEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
class FieldEvent extends DataEvents {
    final String department_id;
  final String semestre;
  const FieldEvent({required this.department_id,required this.semestre});

  @override
  List<Object?> get props => [department_id, semestre];
}

class SectionEvent extends DataEvents {
   final String id_lev_spec;
  final String semestre;
  const SectionEvent({required this.id_lev_spec,required this.semestre});

  @override
  List<Object?> get props => [id_lev_spec, semestre];
}
class GroupEvent extends DataEvents {
  final String section_id;
  final String semestre;
  const GroupEvent({required this.section_id, required this.semestre});

  @override
  List<Object?> get props => [section_id, semestre];
}
class LevelEvent extends DataEvents {
   final String id_field;
  final String semestre;
  const LevelEvent({required this.id_field,required this.semestre});

  @override
  List<Object?> get props => [id_field, semestre];
}


class TimeTableEvent extends DataEvents {
  final String id_group;
  final String id_sec;
  final String semestre;
  const TimeTableEvent(
      {required this.id_group, required this.id_sec, required this.semestre});

  @override
  List<Object?> get props => [id_group, id_sec, semestre];
}
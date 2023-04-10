import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/department.dart';
import '../../../domain/entities/faculty.dart';
import '../../../domain/entities/field.dart';
import '../../../domain/entities/group.dart';
import '../../../domain/entities/level.dart';
import '../../../domain/entities/section.dart';

class DataState extends Equatable {
  final RequestState facultyState;
  final String messageFaculty;
  final List<Faculty> faculties;
  final RequestState departmentState;
  final String departmentMessage;
  final List<Department> departments;
  final RequestState fieldState;
  final String fieldMessage;
  final List<Field> fields;
  final RequestState groupState;
  final String groupMessage;
  final List<Group> groupes;
  final RequestState sectionState;
  final String sectionMessage;
  final List<Section> sections;
  final RequestState levelState;
  final String levelMessage;
  final List<Level> levels;
   final RequestState timeTableState;
  final String timeTableMessage;
  final List<List<String>> timeTable;

  const DataState({
      this.fieldState =  RequestState.loading,
      this.fieldMessage ="",
      this.fields = const [],
      this.groupState =  RequestState.loading,
      this.groupMessage ="",
      this.groupes = const [],
      this.sectionState =  RequestState.loading,
      this.sectionMessage = "",
      this.sections= const [],
      this.levelState =  RequestState.loading,
      this.levelMessage ="",
      this.levels = const [],
      this.faculties = const [],
      this.facultyState = RequestState.loading,
      this.messageFaculty = "",
      this.departments = const [],
      this.departmentState = RequestState.loading,
      this.departmentMessage = "",
      this.timeTableState =  RequestState.loading, this.timeTableMessage="", this.timeTable = const []
      
      });

  DataState copyWith({
    List<Faculty>? faculties,
    RequestState? facultyState,
    String? messageFaculty,
    List<Department>? departments,
    RequestState? departmentState,
    String? departmentMessage,
     List<Field>? fields,
    RequestState? fieldState,
    String? fieldMessage,
     List<Group>? groupes,
    RequestState? groupState,
    String? groupMessage,
     List<Section>? sections,
    RequestState? sectionState,
    String? sectionMessage,
     List<Level>? levels,
    RequestState? levelState,
    String? levelMessage,
     List<List<String>>? timeTable,
    RequestState? timeTableState,
    String? timeTableMessage
  }) {
    return DataState(
      faculties: faculties ?? this.faculties,
      facultyState: facultyState ?? this.facultyState,
      messageFaculty: messageFaculty ?? this.messageFaculty,
      departments: departments ?? this.departments,
      departmentState: departmentState ?? this.departmentState,
      departmentMessage: departmentMessage ?? this.departmentMessage,
      fields: fields ?? this.fields,
      fieldState: fieldState ?? this.fieldState,
      fieldMessage: fieldMessage ?? this.fieldMessage,
      groupes: groupes ?? this.groupes,
      groupState: groupState ?? this.groupState,
      groupMessage: groupMessage ?? this.groupMessage,
      sections: sections ?? this.sections,
      sectionState: sectionState ?? this.sectionState,
      sectionMessage: sectionMessage ?? this.sectionMessage,
      levels: levels ?? this.levels,
      levelState: levelState ?? this.levelState,
      levelMessage: levelMessage ?? this.levelMessage,
      timeTable: timeTable ?? this.timeTable,
      timeTableState: timeTableState ?? this.timeTableState,
      timeTableMessage: timeTableMessage ?? this.timeTableMessage

    );
  }

  @override
  List<Object?> get props => [
        faculties,
        facultyState,
        messageFaculty,
        departments,
        departmentState,
        departmentMessage,
        fields,
        fieldState,
        fieldMessage,
        groupes,
        groupState,
        groupMessage,
        sections,
        sectionState,
        sectionMessage,
        levels,
        levelState,
        levelMessage,
        timeTable,
        timeTableState,
        timeTableMessage

      ];
}

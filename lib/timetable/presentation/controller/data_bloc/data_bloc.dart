import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/baseUseCase.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/usecases/FacultyUseCase.dart';
import '../../../domain/usecases/Field_UseCase.dart';
import '../../../domain/usecases/departmentUseCase.dart';
import '../../../domain/usecases/group_UseCase.dart';
import '../../../domain/usecases/level_UseCase.dart';
import '../../../domain/usecases/section_UseCase.dart';
import '../../../domain/usecases/time_tableUseCase.dart';
import '../data_bloc/data_events.dart';
import '../data_bloc/data_state.dart';

class DataBloc extends Bloc<DataEvents, DataState> {
  final FacultyUseCase facultyUseCase;
  final DepartmentUseCase departmentUseCase;
  final FieldUseCase fieldUseCase;
  final SectionUseCase sectionUseCase;
  final GroupUseCase groupUseCase;
  final LevelUseCase levelUseCase;
  final TimeTableUseCase timeTableUseCase;
  DataBloc(
      this.facultyUseCase,
      this.departmentUseCase,
      this.fieldUseCase,
      this.sectionUseCase,
      this.groupUseCase,
      this.levelUseCase,
      this.timeTableUseCase)
      : super(const DataState()) {
    // on<PlayingNowMovies>((event, emit) async {});

    on<FacultyEvents>(_getFacultiesBloc);
    on<DepartmentEvent>(_getDepartmentsBloc);
    on<SectionEvent>(_getSectionsBloc);
    on<FieldEvent>(_getFieldsBloc);
    on<GroupEvent>(_getGroupsBloc);
    on<LevelEvent>(_getLevelsBloc);
    on<TimeTableEvent>(_getTimeTableBloc);
  }

  FutureOr<void> _getFacultiesBloc(
      FacultyEvents event, Emitter<DataState> emit) async {
    final result = await facultyUseCase(const NoParametres());
    //print("result faculty =>\n");
    //print(result);
    result.fold(
        (l) => emit(const DataState(
            facultyState: RequestState.error,
            messageFaculty: "Error in the Api")),
        (r) => emit(DataState(
            faculties: r,
            facultyState: RequestState.loaded,
            messageFaculty: "Data Reaches Completely ! ")));
  }

  FutureOr<void> _getDepartmentsBloc(
      DepartmentEvent event, Emitter<DataState> emit) async {
    final result = await departmentUseCase(event.id);
    result.fold(
        (l) => emit(state.copyWith(
            departmentState: RequestState.error,
            departmentMessage: "Error in the Api")),
        (r) => emit(state.copyWith(
            departments: r,
            departmentState: RequestState.loaded,
            departmentMessage: "Data Reaches Completely ! ")));
  }

  FutureOr<void> _getFieldsBloc(
      FieldEvent event, Emitter<DataState> emit) async {
    final result = await fieldUseCase(FieldParametres(
        department_id: event.department_id, semestre: event.semestre));
    result.fold(
        (l) => emit(state.copyWith(
            fieldState: RequestState.error, fieldMessage: "Error in the Api")),
        (r) => emit(state.copyWith(
            fields: r,
            fieldState: RequestState.loaded,
            fieldMessage: "Data Reaches Completely ! ")));
  }

  FutureOr<void> _getLevelsBloc(
      LevelEvent event, Emitter<DataState> emit) async {
    final result = await levelUseCase(
        LevelParametres(id_field: event.id_field, semestre: event.semestre));
    print(
        "\n result Levels -----------------------------------------------------------\n");
    print(result);
    print(
        "\n End result Levels -----------------------------------------------------------\n");
    result.fold(
        (l) => emit(state.copyWith(
            levelState: RequestState.error, levelMessage: "Error in the Api")),
        (r) => emit(state.copyWith(
            levels: r,
            levelState: RequestState.loaded,
            levelMessage: "Data Reaches Completely ! ")));
  }

  FutureOr<void> _getSectionsBloc(
      SectionEvent event, Emitter<DataState> emit) async {
    final result = await sectionUseCase(SectionParametres(
        id_field: event.id_lev_spec, semestre: event.semestre));
    result.fold(
        (l) => emit(state.copyWith(
            sectionState: RequestState.error,
            sectionMessage: "Error in the Api")),
        (r) => emit(state.copyWith(
            sections: r,
            sectionState: RequestState.loaded,
            sectionMessage: "Data Reaches Completely ===>>>>>> ! ")));
  }

  FutureOr<void> _getGroupsBloc(
      GroupEvent event, Emitter<DataState> emit) async {
    final result = await groupUseCase(GroupParametres(
        section_id: event.section_id, semestre: event.semestre));
    result.fold(
        (l) => emit(state.copyWith(
            groupState: RequestState.error, groupMessage: "Error in the Api")),
        (r) => emit(state.copyWith(
            groupes: r,
            groupState: RequestState.loaded,
            groupMessage: "Data Reaches Completely ! ")));
  }

  FutureOr<void> _getTimeTableBloc(
      TimeTableEvent event, Emitter<DataState> emit) async {
    final result = await timeTableUseCase(TimeTableParametres(id_group: event.id_group, id_sec: event.id_sec, semestre: event.semestre));
 
    result.fold(
        (l) => emit(state.copyWith(
            timeTableState: RequestState.error,
            timeTableMessage: "Error in the Api")),
        (r) => emit(state.copyWith(
            timeTable: r,
            timeTableState: RequestState.loaded,
            timeTableMessage: "Data Reaches Completely ! ")));
  }
}

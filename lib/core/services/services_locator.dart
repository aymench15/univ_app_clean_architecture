import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:univ/core/localDB/database.dart';
import '../../timetable/data/datasource/time_datasource.dart';
import '../../timetable/data/repository/data_repository.dart';
import '../../timetable/domain/repository/domain_repository.dart';
import '../../timetable/domain/usecases/FacultyUseCase.dart';
import '../../timetable/domain/usecases/Field_UseCase.dart';
import '../../timetable/domain/usecases/departmentUseCase.dart';
import '../../timetable/domain/usecases/group_UseCase.dart';
import '../../timetable/domain/usecases/level_UseCase.dart';
import '../../timetable/domain/usecases/section_UseCase.dart';
import '../../timetable/domain/usecases/time_tableUseCase.dart';
import '../../timetable/presentation/controller/data_bloc/data_bloc.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerFactory(() => DataBloc(
        getIt(), getIt(), getIt(), getIt(), getIt(), getIt(), getIt()));
    getIt.registerLazySingleton(() => FacultyUseCase(getIt()));
    getIt.registerLazySingleton(() => DepartmentUseCase(getIt()));
    getIt.registerLazySingleton(() => FieldUseCase(getIt()));
    getIt.registerLazySingleton(() => GroupUseCase(getIt()));
    getIt.registerLazySingleton(() => LevelUseCase(getIt()));
    getIt.registerLazySingleton(() => SectionUseCase(getIt()));
    getIt.registerLazySingleton(() => TimeTableUseCase(getIt()));
    getIt.registerLazySingleton(() => DBHelper());

    getIt
        .registerLazySingleton<DomainRepository>(() => DataRepository(getIt()));

    getIt.registerLazySingleton<BaseRemoteData>(() => RemoteData());
    /* 
      //Movie movie = (await PlayingNowMovies(dimainRepository).execute()) as Movie;
      final result = await PlayingNowMoviesUseCase(domainRepository).execute();*/
  }
}

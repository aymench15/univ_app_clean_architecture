import 'package:get_it/get_it.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_bloc.dart';

import '../../movies/data/datasource/movie_datasource.dart';
import '../../movies/data/repository/data_movie_repository.dart';
import '../../movies/domain/repository/domain_repository.dart';
import '../../movies/domain/usecases/PlayingNowMoviesUseCase.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerFactory(() => MoviesBloc(getIt()));

    getIt.registerLazySingleton(() => PlayingNowMoviesUseCase(getIt()));

    getIt.registerLazySingleton<DomainRepository>(
        () => DataMovieRepository(getIt()));

    getIt.registerLazySingleton<BaseMovieRemoteData>(() => MovieRemoteData());
    /* 
      //Movie movie = (await PlayingNowMovies(dimainRepository).execute()) as Movie;
      final result = await PlayingNowMoviesUseCase(domainRepository).execute();*/
  }
}

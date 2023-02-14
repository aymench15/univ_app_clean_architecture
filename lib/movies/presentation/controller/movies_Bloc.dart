import 'package:movie_app_with_two_modules/core/utils/enums.dart';
import 'package:movie_app_with_two_modules/movies/domain/usecases/PlayingNowMoviesUseCase.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_events.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/movie_datasource.dart';
import '../../data/repository/data_movie_repository.dart';
import '../../domain/repository/domain_repository.dart';

class MoviesBloc extends Bloc<MoviesEvents, MovieState> {
  MoviesBloc() : super(const MovieState()) {
    on(<PlayingNowMovies>(event, emit) async {
      MovieRemoteData movieRemoteData = MovieRemoteData();
      DomainRepository domainRepository = DataMovieRepository(movieRemoteData);
      //Movie movie = (await PlayingNowMovies(dimainRepository).execute()) as Movie;
      final result = await PlayingNowMoviesUseCase(domainRepository).execute();

      print(result);
      result.fold((l) => emit(MovieState(nowState: RequestState.error , message: l.message)),
          (r) => emit(const MovieState(nowState: RequestState.loaded)));
    });
  }
}

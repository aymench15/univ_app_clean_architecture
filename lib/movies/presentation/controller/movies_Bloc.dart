import 'package:movie_app_with_two_modules/core/utils/enums.dart';
import 'package:movie_app_with_two_modules/movies/domain/usecases/PlayingNowMoviesUseCase.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_events.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvents, MovieState> {
  final PlayingNowMoviesUseCase playingNow;
  MoviesBloc(this.playingNow) : super(const MovieState()) {
    on(<PlayingNowMovies>(event, emit) async {
      final result = await playingNow.execute();
      //print(result);
      result.fold(
          (l) => emit(
              MovieState(nowState: RequestState.error, message: l.message)),
          (r) => emit( MovieState(
              movies: r,
              nowState: RequestState.loaded,
              message: "Data Reaches Completely ! ")));
    });
  }
}

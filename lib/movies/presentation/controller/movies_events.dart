import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {

  const MoviesEvents();
  @override
  List<Object> get props => [];

}


class PlayingNowMovies extends MoviesEvents{}
class PopularMovies extends MoviesEvents{}
class TopRatedMovies extends MoviesEvents{}

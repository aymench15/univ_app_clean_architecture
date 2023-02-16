import 'package:equatable/equatable.dart';
import 'package:movie_app_with_two_modules/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> movies;
   final RequestState nowState;
  final String message;
  const MovieState({  this.movies = const [],  this.nowState = RequestState.loading,  this.message = ""});
  @override
  List<Object?> get props => [movies, nowState,message];
}

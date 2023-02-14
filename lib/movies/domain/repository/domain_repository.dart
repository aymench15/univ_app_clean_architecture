import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/movie.dart';

abstract class DomainRepository {
  Future<Either<Failure, List<Movie>>> getMoviesPlayingNow();
  Future<Either<Failure, List<Movie>>> getMoviesPopular();
  Future<Either<Failure, List<Movie>>> getMoviesTopRated();
}

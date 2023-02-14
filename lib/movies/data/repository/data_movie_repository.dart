import 'package:dartz/dartz.dart';
import 'package:movie_app_with_two_modules/core/errors/errors.dart';
import 'package:movie_app_with_two_modules/core/errors/failure.dart';
import 'package:movie_app_with_two_modules/movies/domain/entities/movie.dart';

import '../../domain/repository/domain_repository.dart';
import '../datasource/movie_datasource.dart';

class DataMovieRepository implements DomainRepository {
  final BaseMovieRemoteData movieRemote;

  DataMovieRepository(this.movieRemote);

  @override
  Future<Either<Failure, List<Movie>>> getMoviesPlayingNow() async {
    final res = await movieRemote.getMovieRemoteDataPlayingNow();
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesPopular() async {
    final res = await movieRemote.getMovieRemoteDataPlayingNow();
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesTopRated() async {
    final res = await movieRemote.getMovieRemoteDataPlayingNow();
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }
}

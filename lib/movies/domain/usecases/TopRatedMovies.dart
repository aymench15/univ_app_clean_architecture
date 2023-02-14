import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/movie.dart';
import '../repository/domain_repository.dart';

class TopRatedMovies {
  final DomainRepository movieRepository;

  TopRatedMovies(this.movieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await movieRepository.getMoviesTopRated();
  }
}
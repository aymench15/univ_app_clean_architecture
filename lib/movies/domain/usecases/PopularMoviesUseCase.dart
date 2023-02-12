import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../entities/movie.dart';
import '../repository/domain_repository.dart';

class PopularMovies {
  final DomainRepository movieRepository;

  PopularMovies(this.movieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await movieRepository.getMoviesPopular();
  }
}
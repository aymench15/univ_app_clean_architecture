import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../entities/movie.dart';
import '../repository/domain_repository.dart';

class PlayingNowMoviesUseCase {
  final DomainRepository movieRepository;

  PlayingNowMoviesUseCase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await movieRepository.getMoviesPlayingNow();
  }
}

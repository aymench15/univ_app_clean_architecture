import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecase/baseUseCase.dart';
import '../entities/level.dart';
import '../repository/domain_repository.dart';

class LevelUseCase extends BaseUseCase<List<Level>, LevelParametres> {
  final DomainRepository levelRepository;
  LevelUseCase(this.levelRepository);
  @override
  Future<Either<Failure, List<Level>>> call(LevelParametres parametres) async {
    return await levelRepository.getLevel(parametres);
  }
}

class LevelParametres extends Equatable {
  final String id_field;
  final String semestre;
  const LevelParametres({required this.id_field,required this.semestre});
  @override
  // TODO: implement props
  List<Object?> get props => [id_field, semestre];
}

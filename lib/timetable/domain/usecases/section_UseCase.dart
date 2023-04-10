import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecase/baseUseCase.dart';
import '../entities/section.dart';
import '../repository/domain_repository.dart';

class SectionUseCase extends BaseUseCase<List<Section>, SectionParametres> {
  final DomainRepository sectionRepository;
  SectionUseCase(this.sectionRepository);
  @override
  Future<Either<Failure, List<Section>>> call(
      SectionParametres parametres) async {
    return await sectionRepository.getSection(parametres);
  }
}

class SectionParametres extends Equatable {
  final String id_field;
  final String semestre;
  const SectionParametres({required this.id_field, required this.semestre});
  @override
  // TODO: implement props
  List<Object?> get props => [id_field, semestre];
}

import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/baseUseCase.dart';
import '../entities/field.dart';
import '../repository/domain_repository.dart';

class FieldUseCase extends BaseUseCase<List<Field>, FieldParametres> {
  final DomainRepository fieldRepository;

  FieldUseCase(this.fieldRepository);
  @override
  Future<Either<Failure, List<Field>>> call(FieldParametres parametres) async {
    return await fieldRepository.getField(parametres);
  }
}


class FieldParametres extends Equatable {
  final String department_id;
  final String semestre;

  const FieldParametres({required this.department_id,required this.semestre});
  @override
  // TODO: implement props
  List<Object?> get props => [department_id, semestre];
}
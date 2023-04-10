import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecase/baseUseCase.dart';
import '../entities/group.dart';
import '../repository/domain_repository.dart';

class GroupUseCase extends BaseUseCase<List<Group>, GroupParametres> {
  final DomainRepository groupRepository;
  GroupUseCase(this.groupRepository);
  @override
  Future<Either<Failure, List<Group>>> call(GroupParametres parametres) async {
   return await groupRepository.getGroup(parametres);
  }
}

class GroupParametres extends Equatable {
  final String section_id;
  final String semestre;

  const GroupParametres({required this.section_id,required this.semestre});
  @override
  // TODO: implement props
  List<Object?> get props => [section_id, semestre];
}

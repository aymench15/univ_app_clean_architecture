import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/baseUseCase.dart';
import '../repository/domain_repository.dart';

class TimeTableUseCase
    extends BaseUseCase<List<List<String>>, TimeTableParametres> {
  final DomainRepository tiemTableRepository;
  TimeTableUseCase(this.tiemTableRepository);
  @override
  Future<Either<Failure, List<List<String>>>> call(
      TimeTableParametres parametres) async {
    return await tiemTableRepository.getTimeTable(parametres);
  }
}

class TimeTableParametres extends Equatable {
  final String id_group;
  final String id_sec;
  final String semestre;
  const TimeTableParametres(
      {required this.id_group, required this.id_sec, required this.semestre});
  @override
  // TODO: implement props
  List<Object?> get props => [id_group, id_sec, semestre];
}

import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/baseUseCase.dart';
import '../entities/faculty.dart';
import '../repository/domain_repository.dart';

class FacultyUseCase extends BaseUseCase<List<Faculty>,NoParametres>{
  final DomainRepository facultyRepository;

  FacultyUseCase(this.facultyRepository);
  
  @override
  Future<Either<Failure, List<Faculty>>> call(NoParametres noParametres) async {
 return await facultyRepository.getFaculty();
  }


}
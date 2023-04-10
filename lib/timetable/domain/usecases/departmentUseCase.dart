import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecase/baseUseCase.dart';
import '../entities/department.dart';
import '../repository/domain_repository.dart';

class DepartmentUseCase extends BaseUseCase<List<Department>, String> {
  final DomainRepository departmentRepository;

  DepartmentUseCase(this.departmentRepository);

  @override
  Future<Either<Failure, List<Department>>> call(String fac_id) async {
    return await departmentRepository.getDepartments(fac_id);
  }
}

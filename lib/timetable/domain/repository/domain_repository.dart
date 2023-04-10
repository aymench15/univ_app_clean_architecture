import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../entities/department.dart';
import '../entities/faculty.dart';
import '../entities/field.dart';
import '../entities/group.dart';
import '../entities/level.dart';
import '../entities/section.dart';
import '../usecases/Field_UseCase.dart';
import '../usecases/group_UseCase.dart';
import '../usecases/level_UseCase.dart';
import '../usecases/section_UseCase.dart';
import '../usecases/time_tableUseCase.dart';

abstract class DomainRepository {
  Future<Either<Failure,List<Faculty>>> getFaculty();
  Future<Either<Failure,List<Department>>> getDepartments(String facId);
  Future<Either<Failure,List<Field>>> getField(FieldParametres parametres);
  Future<Either<Failure,List<Section>>> getSection(SectionParametres parametres);
  Future<Either<Failure,List<Group>>> getGroup(GroupParametres parametres);
  Future<Either<Failure,List<Level>>> getLevel(LevelParametres parametres);
   Future<Either<Failure,List<List<String>>>> getTimeTable(TimeTableParametres parametres);
}

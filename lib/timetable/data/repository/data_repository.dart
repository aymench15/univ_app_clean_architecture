import 'package:dartz/dartz.dart';
//import 'package:movie_app_with_two_modules/movies/domain/entities/movie.dart';

import '../../../core/errors/errors.dart';
import '../../../core/errors/failure.dart';
import '../../domain/entities/department.dart';
import '../../domain/entities/faculty.dart';
import '../../domain/entities/field.dart';
import '../../domain/entities/group.dart';
import '../../domain/entities/level.dart';
import '../../domain/entities/section.dart';
import '../../domain/repository/domain_repository.dart';
import '../../domain/usecases/Field_UseCase.dart';
import '../../domain/usecases/group_UseCase.dart';
import '../../domain/usecases/level_UseCase.dart';
import '../../domain/usecases/section_UseCase.dart';
import '../../domain/usecases/time_tableUseCase.dart';
import '../datasource/time_datasource.dart';

class DataRepository implements DomainRepository {
  final BaseRemoteData dataRemote;

  DataRepository(this.dataRemote);

  @override
  Future<Either<Failure, List<Faculty>>> getFaculty() async {
    final res = await dataRemote.getFaculties();
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }

  @override
  Future<Either<Failure, List<Department>>> getDepartments(String id) async {
    final res = await dataRemote.getDepartments(id);
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }

  @override
  Future<Either<Failure, List<Field>>> getField(
      FieldParametres parametres) async {
    final res = await dataRemote.getField(parametres);
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }

  @override
  Future<Either<Failure, List<Group>>> getGroup(
      GroupParametres parametres) async {
    final res = await dataRemote.getGroup(parametres);
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }

  @override
  Future<Either<Failure, List<Level>>> getLevel(
      LevelParametres parametres) async {
    final res = await dataRemote.getLevel(parametres);
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }

  @override
  Future<Either<Failure, List<Section>>> getSection(
      SectionParametres parametres) async {
    final res = await dataRemote.getSection(parametres);
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }

  @override
  Future<Either<Failure,List<List<String>>>> getTimeTable(
      TimeTableParametres parametres) async {
    final res = await dataRemote.getTimeTable(parametres);
    try {
      return Right(res);
    } on HandleErrors catch (err) {
      return Left(ServerFailure(err.errorExecption.messageStatus));
    }
  }
}

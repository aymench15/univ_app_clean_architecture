import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:univ/core/errors/failure.dart';

abstract class BaseUseCase<T, Parametres> {
  Future<Either<Failure, T>> call(Parametres parametres);
}

class NoParametres extends Equatable {
  const NoParametres();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


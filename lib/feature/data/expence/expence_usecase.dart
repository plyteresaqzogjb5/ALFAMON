import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pp_14_copy/common/models/expence.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:pp_14_copy/common/types/usecase.dart';
import 'package:pp_14_copy/feature/data/expence/expence_repositories_impl.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

class CreateExpenceUsecase extends UseCase<void, Expence> {
  final ExpenceRepository repository = sl.get<ExpenceRepository>();

  CreateExpenceUsecase();

  @override
  Future<Either<Failure, void>> call([Expence? params]) async {
    try {
      return await repository.createExpence(params!);
    } on InvalidDataFailure catch (e) {
      if (kDebugMode) {
        print('Error inserting balance: $e');
      }
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}

class GetExpenceUsecase extends UseCase<List<Expence>, DateTime> {
  final ExpenceRepository repository = sl.get<ExpenceRepository>();

  GetExpenceUsecase();

  @override
  Future<Either<Failure, List<Expence>>> call([DateTime? params]) async {
    try {
      return await repository.getExpence(params!);
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message
      ));
    }
  }
}

class GetTotalAmountsUsecase extends UseCase<List<double>, NoParams> {
  final ExpenceRepository repository = sl.get<ExpenceRepository>();

  GetTotalAmountsUsecase();

  @override
  Future<Either<Failure, List<double>>> call([NoParams? params]) async {
    try {
      return await repository.getTotalAmounts();
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}

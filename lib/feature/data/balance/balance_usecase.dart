import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:alfamon/common/models/balance.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:alfamon/common/types/usecase.dart';
import 'package:alfamon/feature/data/balance/balance_repositories_impl.dart';
import 'package:alfamon/feature/services/injection.dart';

class CreateBalanceUsecase extends UseCase<void, Balance> {
  final BalanceRepository repository = sl.get<BalanceRepository>();

  CreateBalanceUsecase();

  @override
  Future<Either<Failure, void>> call([Balance? params]) async {
    try {
      return await repository.createBalance(params!);
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

class GetBalanceUsecase extends UseCase<Balance, NoParams> {
  final BalanceRepository repository = sl.get<BalanceRepository>();

  GetBalanceUsecase();

  @override
  Future<Either<Failure, Balance>> call([NoParams? params]) async {
    try {
      return await repository.getBalance();
    } on InvalidDataFailure catch (e) {
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}

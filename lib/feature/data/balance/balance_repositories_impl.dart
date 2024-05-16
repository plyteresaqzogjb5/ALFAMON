import 'package:pp_14_copy/common/models/balance.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pp_14_copy/feature/data/balance/balance_datasoruce.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

class BalanceRepository {
  final BalanceDataSource insertHelper = sl.get<BalanceDataSource>();

  Future<Either<Failure, int>> createBalance(Balance balance) async {
    try {
      final response = await insertHelper.insertBalance(balance);
      if (response != null) {
        return Right(response);
      } else {
        throw InvalidDataFailure(message: "Can't create a balance");
      }
    } on InvalidDataFailure {
      return Left(InvalidDataFailure(message: "Can't create a balance"));
    }
  }

  Future<Either<Failure, Balance>> getBalance() async {
    try {
      final response = await insertHelper.getBalance();
      if (response != null) {
        return Right(response);
      } else {
        throw InvalidDataFailure(message: "Can't get a balance");
      }
    } on InvalidDataFailure {
      return Left(InvalidDataFailure(message: "Can't get a balance"));
    }
  }
}

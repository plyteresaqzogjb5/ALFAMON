import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:alfamon/common/models/coin.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:alfamon/common/types/usecase.dart';
import 'package:alfamon/feature/data/currency/currency_repositories.dart';
import 'package:alfamon/feature/services/injection.dart';

class GetListCurrencyUsecase extends UseCase<List<Coin>, NoParams> {
  final CurrencyRepository repository = sl.get<CurrencyRepository>();

  GetListCurrencyUsecase();

  @override
  Future<Either<Failure, List<Coin>>> call([NoParams? params]) async {
    try {
      return await repository.getListCurrency();
    } on InvalidDataFailure catch (e) {
      if (kDebugMode) {
        print('Error inserting news: $e');
      }
      return Left(InvalidDataFailure(
        message: e.message,
      ));
    }
  }
}

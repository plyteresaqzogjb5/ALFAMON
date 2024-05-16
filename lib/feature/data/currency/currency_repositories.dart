import 'package:pp_14_copy/common/models/coin.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pp_14_copy/feature/data/currency/currency_datasoruce.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

class CurrencyRepository {
  final CurrencyDataSource newsDataSource = sl.get<CurrencyDataSource>();

  Future<Either<Failure, List<Coin>>> getListCurrency() async {
    try {
      final response = await newsDataSource.getListCuurency();
      return Right(response);
    } on InvalidDataFailure {
      return Left(InvalidDataFailure(message: "Can't get a news"));
    }
  }
}

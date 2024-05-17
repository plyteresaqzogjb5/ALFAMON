import 'package:alfamon/common/models/coin.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:alfamon/feature/data/currency/currency_datasoruce.dart';
import 'package:alfamon/feature/services/injection.dart';

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

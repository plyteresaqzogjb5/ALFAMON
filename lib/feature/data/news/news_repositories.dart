import 'package:alfamon/common/models/news.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:alfamon/feature/data/news/news_datasoruce.dart';
import 'package:alfamon/feature/services/injection.dart';

class NewsRepository {
  final NewsDataSource newsDataSource = sl.get<NewsDataSource>();

  Future<Either<Failure, List<News?>>> getNewsTipsforTravel() async {
    try {
      final response = await newsDataSource.getNewsTipsforTravel();
      return Right(response);
    } on InvalidDataFailure {
      return Left(InvalidDataFailure(message: "Can't get a news"));
    }
  }

  Future<Either<Failure, List<News?>>> getNewsCountriesforTraveling() async {
    try {
      final response = await newsDataSource.getNewsCountriesforTraveling();
      return Right(response);
    } on InvalidDataFailure {
      return Left(InvalidDataFailure(message: "Can't get a news"));
    }
  }
}

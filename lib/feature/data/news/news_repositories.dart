import 'package:pp_14_copy/common/models/news.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pp_14_copy/feature/data/news/news_datasoruce.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

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

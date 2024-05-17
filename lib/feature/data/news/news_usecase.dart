import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:alfamon/common/models/news.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:alfamon/common/types/usecase.dart';
import 'package:alfamon/feature/data/news/news_repositories.dart';
import 'package:alfamon/feature/services/injection.dart';

class GetNewsCountriesTravelUsecase extends UseCase<List<News?>, NoParams> {
  final NewsRepository repository = sl.get<NewsRepository>();

  GetNewsCountriesTravelUsecase();

  @override
  Future<Either<Failure, List<News?>>> call([NoParams? params]) async {
    try {
      return await repository.getNewsCountriesforTraveling();
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

class GetNewsTipsTravelUsecase extends UseCase<List<News?>, NoParams> {
  final NewsRepository repository = sl.get<NewsRepository>();

  GetNewsTipsTravelUsecase();

  @override
  Future<Either<Failure, List<News?>>> call([NoParams? params]) async {
    try {
      return await repository.getNewsTipsforTravel();
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

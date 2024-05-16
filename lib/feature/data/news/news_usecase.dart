import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pp_14_copy/common/models/news.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:pp_14_copy/common/types/usecase.dart';
import 'package:pp_14_copy/feature/data/news/news_repositories.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

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

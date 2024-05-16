import 'package:pp_14_copy/common/models/expence.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pp_14_copy/feature/data/expence/expence_datasoruce.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

class ExpenceRepository {
  final ExpenceDataSource insertHelper = sl.get<ExpenceDataSource>();

  Future<Either<Failure, int>> createExpence(Expence expence) async {
    try {
      final response = await insertHelper.insertExpence(expence);
      if (response != null) {
        return Right(response);
      } else {
        throw InvalidDataFailure(message: "Can't create a Expence");
      }
    } on InvalidDataFailure {
      return Left(InvalidDataFailure(message: "Can't create a Expence"));
    }
  }

  Future<Either<Failure, List<Expence>>> getExpence(DateTime date) async {
    try {
      final response = await insertHelper.getExpences(date);
      return Right(response);
    } on InvalidDataFailure {
      return Left(InvalidDataFailure(message: "Can't get a Expence"));
    }
  }

  Future<Either<Failure, List<double>>> getTotalAmounts() async {
    try {
      final response = await insertHelper.getTotalAmounts();
      return Right(response);
    } on InvalidDataFailure {
      return Left(InvalidDataFailure(message: "Can't get a Expence"));
    }
  }
}

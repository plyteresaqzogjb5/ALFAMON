import 'package:pp_14_copy/common/types/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call([Params? params]);
}

@immutable
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

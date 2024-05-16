part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class BalancedLoaded extends HomeState {
  final Balance balance;

  const BalancedLoaded({required this.balance});
}

final class ByDateLoaded extends HomeState {
  final List? responsed;

  const ByDateLoaded({required this.responsed});
}

final class TotalAmountLoaded extends HomeState {
  final List<double> responsed;

  const TotalAmountLoaded({required this.responsed});
}

final class HomeError extends HomeState {
  final Failure failure;

  const HomeError({required this.failure});
}

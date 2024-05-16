part of 'currency_bloc.dart';

sealed class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

final class CoinInitial extends CurrencyState {}

class CoinlLoading extends CurrencyState {}

class CoinlLoaded extends CurrencyState {
  final List<Coin> responsed;

  const CoinlLoaded({required this.responsed});
}

final class CoinError extends CurrencyState {
  final Failure failure;

  const CoinError({required this.failure});
}

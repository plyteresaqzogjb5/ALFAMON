part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetBalanceEvent extends HomeEvent {}

class GetTotalAmountEvent extends HomeEvent {}

class GetByDateEvent extends HomeEvent {
  final DateTime date;

  const GetByDateEvent({required this.date});
}

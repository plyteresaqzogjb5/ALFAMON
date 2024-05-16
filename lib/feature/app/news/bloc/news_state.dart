part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

class NewslLoading extends NewsState {}

class NewsTabOnelLoaded extends NewsState {
  final List<News?> responsed;

  const NewsTabOnelLoaded({required this.responsed});
}

class NewsTabSecondlLoaded extends NewsState {
  final List<News?> responsed;

  const NewsTabSecondlLoaded({required this.responsed});
}

final class NewsError extends NewsState {
  final Failure failure;

  const NewsError({required this.failure});
}

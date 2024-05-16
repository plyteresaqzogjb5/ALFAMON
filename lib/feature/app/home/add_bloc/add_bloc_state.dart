part of 'add_bloc_bloc.dart';

sealed class AddBlocState extends Equatable {
  const AddBlocState();

  @override
  List<Object> get props => [];
}

final class AddBlocInitial extends AddBlocState {}

final class AddInitial extends AddBlocState {}

final class CreatedIncome extends AddBlocState {}

final class CreatedExpence extends AddBlocState {}

final class AddError extends AddBlocState {
  final Failure failure;

  const AddError({required this.failure});
}

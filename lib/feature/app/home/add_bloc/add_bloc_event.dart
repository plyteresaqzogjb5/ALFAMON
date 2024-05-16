part of 'add_bloc_bloc.dart';

sealed class AddBlocEvent extends Equatable {
  const AddBlocEvent();

  @override
  List<Object> get props => [];
}

class CreateExpenceEvent extends AddBlocEvent {
  final Expence expence;

  const CreateExpenceEvent({required this.expence});
}

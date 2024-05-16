import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_14_copy/common/models/expence.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:pp_14_copy/feature/data/expence/expence_usecase.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

part 'add_bloc_event.dart';
part 'add_bloc_state.dart';

class AddBloc extends Bloc<AddBlocEvent, AddBlocState> {
  final CreateExpenceUsecase createExpenceUsecase =
      sl.get<CreateExpenceUsecase>();

  AddBloc() : super(AddBlocInitial()) {
    on<CreateExpenceEvent>((event, emit) async {
      emit(AddInitial());
      final response = await createExpenceUsecase.call(event.expence);
      response.fold(
        (failure) => emit(AddError(failure: failure)),
        (ok) {
          emit(CreatedExpence());
        },
      );
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pp_14_copy/common/models/balance.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:pp_14_copy/feature/data/balance/balance_usecase.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final CreateBalanceUsecase createBalanceUsecase =
      sl.get<CreateBalanceUsecase>();

  SettingsBloc() : super(SettingsInitial()) {
    on<CreateBalanceEvent>((event, emit) async {
      emit(SettingsInitial());
      final response = await createBalanceUsecase.call(event.balance);
      response.fold(
        (failure) => emit(SettingsError(failure: failure)),
        (ok) {
          emit(CreatedBalance());
        },
      );
    });
  }
}

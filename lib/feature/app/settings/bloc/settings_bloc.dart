import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:alfamon/common/models/balance.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:alfamon/feature/data/balance/balance_usecase.dart';
import 'package:alfamon/feature/services/injection.dart';

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

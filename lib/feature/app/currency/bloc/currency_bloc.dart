import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:alfamon/common/models/coin.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:alfamon/feature/data/currency/currency_usecase.dart';
import 'package:alfamon/feature/services/injection.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final GetListCurrencyUsecase getListCurrencyUsecase =
      sl.get<GetListCurrencyUsecase>();

  CurrencyBloc() : super(CoinInitial()) {
    on<GetListCoinEvent>((event, emit) async {
      emit(CoinlLoading());

      final response = await getListCurrencyUsecase.call();

      response.fold(
        (failure) => emit(CoinError(failure: failure)),
        (ok) {
          emit(CoinlLoaded(responsed: ok));
        },
      );
    });
  }
}

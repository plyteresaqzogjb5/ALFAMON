import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pp_14_copy/common/models/balance.dart';
import 'package:pp_14_copy/common/types/failures.dart';
import 'package:pp_14_copy/feature/data/balance/balance_usecase.dart';
import 'package:pp_14_copy/feature/data/expence/expence_usecase.dart';
import 'package:pp_14_copy/feature/services/injection.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBalanceUsecase getBalanceUsecase = sl.get<GetBalanceUsecase>();
  final GetExpenceUsecase getExpenceUsecase = sl.get<GetExpenceUsecase>();
  final GetTotalAmountsUsecase getTotalAmountsUsecase =
      sl.get<GetTotalAmountsUsecase>();

  HomeBloc() : super(HomeInitial()) {
    on<GetByDateEvent>((event, emit) async {
      emit(HomeInitial());
      final response = await getExpenceUsecase.call(event.date);
      response.fold(
        (failure) => emit(HomeError(failure: failure)),
        (ok) {
          emit(ByDateLoaded(responsed: ok));
        },
      );
    });
    on<GetBalanceEvent>((event, emit) async {
      emit(HomeInitial());
      final response = await getBalanceUsecase.call();
      response.fold(
        (failure) => emit(HomeError(failure: failure)),
        (ok) {
          emit(BalancedLoaded(balance: ok));
        },
      );
    });
    on<GetTotalAmountEvent>((event, emit) async {
      emit(HomeInitial());
      final response = await getTotalAmountsUsecase.call();
      response.fold(
        (failure) => emit(HomeError(failure: failure)),
        (ok) {
          emit(TotalAmountLoaded(responsed: ok));
        },
      );
    });
  }
}

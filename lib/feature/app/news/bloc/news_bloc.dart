import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:alfamon/common/models/news.dart';
import 'package:alfamon/common/types/failures.dart';
import 'package:alfamon/feature/data/news/news_usecase.dart';
import 'package:alfamon/feature/services/injection.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsCountriesTravelUsecase getNewsCountriesTravelUsecase =
      sl.get<GetNewsCountriesTravelUsecase>();
  final GetNewsTipsTravelUsecase getNewsTipsTravelUsecase =
      sl.get<GetNewsTipsTravelUsecase>();
  NewsBloc() : super(NewsInitial()) {
    on<GetNewsTipsTravelEvent>((event, emit) async {
      emit(NewslLoading());

      final response = await getNewsTipsTravelUsecase.call();

      response.fold(
        (failure) => emit(NewsError(failure: failure)),
        (ok) {
          emit(NewsTabSecondlLoaded(responsed: ok));
        },
      );
    });
    on<GetNewsCountriesTravelEvent>((event, emit) async {
      emit(NewslLoading());
      final response = await getNewsCountriesTravelUsecase.call();

      response.fold(
        (failure) => emit(NewsError(failure: failure)),
        (ok) {
          emit(NewsTabOnelLoaded(responsed: ok));
        },
      );
    });
  }
}

import 'package:get_it/get_it.dart';
import 'package:pp_14_copy/common/styles/bloc/styles_bloc.dart';
import 'package:pp_14_copy/feature/app/currency/bloc/currency_bloc.dart';
import 'package:pp_14_copy/feature/app/home/add_bloc/add_bloc_bloc.dart';
import 'package:pp_14_copy/feature/app/home/home_bloc/home_bloc.dart';
import 'package:pp_14_copy/feature/app/news/bloc/news_bloc.dart';
import 'package:pp_14_copy/feature/app/settings/bloc/settings_bloc.dart';
import 'package:pp_14_copy/feature/data/balance/balance_datasoruce.dart';
import 'package:pp_14_copy/feature/data/balance/balance_repositories_impl.dart';
import 'package:pp_14_copy/feature/data/balance/balance_usecase.dart';
import 'package:pp_14_copy/feature/data/currency/currency_datasoruce.dart';
import 'package:pp_14_copy/feature/data/currency/currency_repositories.dart';
import 'package:pp_14_copy/feature/data/currency/currency_usecase.dart';
import 'package:pp_14_copy/feature/data/expence/expence_datasoruce.dart';
import 'package:pp_14_copy/feature/data/expence/expence_repositories_impl.dart';
import 'package:pp_14_copy/feature/data/expence/expence_usecase.dart';
import 'package:pp_14_copy/feature/data/news/news_datasoruce.dart';
import 'package:pp_14_copy/feature/data/news/news_repositories.dart';
import 'package:pp_14_copy/feature/data/news/news_usecase.dart';
import 'package:pp_14_copy/feature/services/remote_config_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // GetIt.I.registerSingletonAsync<RemoteConfigService>(() => RemoteConfigService().init());
  // await GetIt.I.isReady<RemoteConfigService>();
  sl.registerLazySingleton(() => BalanceDataSource());
  sl.registerLazySingleton(() => CreateBalanceUsecase());
  sl.registerLazySingleton(() => BalanceRepository());
  sl.registerLazySingleton(() => GetBalanceUsecase());

  //
  sl.registerLazySingleton(() => RemoteConfigService());

  // sl.registerLazySingleton(() => ExpenceDatabaseHelper());
  sl.registerLazySingleton(() => ExpenceDataSource());
  sl.registerLazySingleton(() => ExpenceRepository());
  sl.registerLazySingleton(() => GetExpenceUsecase());
  sl.registerLazySingleton(() => CreateExpenceUsecase());
  sl.registerLazySingleton(() => GetTotalAmountsUsecase());

  sl.registerLazySingleton(() => NewsDataSource());
  sl.registerLazySingleton(() => NewsRepository());
  sl.registerLazySingleton(() => GetNewsCountriesTravelUsecase());
  sl.registerLazySingleton(() => GetNewsTipsTravelUsecase());

  sl.registerLazySingleton(() => CurrencyDataSource());
  sl.registerLazySingleton(() => CurrencyRepository());
  sl.registerLazySingleton(() => GetListCurrencyUsecase());

  sl.registerLazySingleton(() => StylesBloc());
  sl.registerLazySingleton(() => AddBloc());
  sl.registerLazySingleton(() => HomeBloc());
  sl.registerLazySingleton(() => SettingsBloc());
  sl.registerLazySingleton(() => NewsBloc());
  sl.registerLazySingleton(() => CurrencyBloc());

  // GetIt.I.registerSingletonAsync<StorageService>(() => StorageService().init());
  // await GetIt.I.isReady<StorageService>();
  // GetIt.I.registerSingleton<NetworkService>(NetworkService());
}

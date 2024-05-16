import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pp_14_copy/common/styles/bloc/styles_bloc.dart';
import 'package:pp_14_copy/common/styles/themedata.dart';
import 'package:pp_14_copy/feature/app/currency/bloc/currency_bloc.dart';
import 'package:pp_14_copy/feature/app/home/add_bloc/add_bloc_bloc.dart';
import 'package:pp_14_copy/feature/app/home/home_bloc/home_bloc.dart';
import 'package:pp_14_copy/feature/app/news/bloc/news_bloc.dart';
import 'package:pp_14_copy/feature/app/settings/bloc/settings_bloc.dart';
import 'package:pp_14_copy/feature/data/balance/balance_db.dart';
import 'package:pp_14_copy/feature/data/expence/expence_db.dart';
import 'package:pp_14_copy/feature/services/navigation/routes.dart';
import 'package:pp_14_copy/feature/services/remote_config_service.dart';
import 'feature/services/injection.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:pp_14_copy/firebase_options.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _initApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    AppInfo(
      data: await AppInfoData.get(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? showOnboarding;
  bool? isChangeTheme = false;

  @override
  void initState() {
    checkFirstSeen();
    super.initState();
  }

  Future<void> checkFirstSeen() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool? seen = prefs.getBool('seenOnboarding');
    // setState(() {
    //   showOnboarding = seen ?? true;
    // });

    // if (seen == null) {
    //   await prefs.setBool('seenOnboarding', showOnboarding!);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<StylesBloc>()),
        BlocProvider(create: (context) => di.sl<HomeBloc>()),
        BlocProvider(create: (context) => di.sl<SettingsBloc>()),
        BlocProvider(create: (context) => di.sl<AddBloc>()),
        BlocProvider(create: (context) => di.sl<NewsBloc>()),
        BlocProvider(create: (context) => di.sl<CurrencyBloc>()),
      ],
      child: BlocConsumer<StylesBloc, StylesState>(listener: (context, state) {
        if (state is GetChangeTheme) {
          setState(() {
            isChangeTheme = state.isTheme;
          });
          // Перестройка виджета после изменения темы
          setState(() {});
        } else if (state is StylesChanged) {
          setState(() {
            isChangeTheme = state.isChangeTheme;
          });
        }
      }, builder: (context, state) {
        // BlocProvider.of<StylesBloc>(context).add(GetStylesEvent());
        return MaterialApp(
            title: 'Alfa MON Track finance & rate',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(context, !isChangeTheme!),
            routes: Routes.get(context),
          
            // home: showOnboarding == true
            //     ? const OnboardingScreen()
            //     : const MainPageWidget(),
            );
      }),
    );
  }
}


Future<void> initHive() async {
  final applicationDirectory = await getApplicationDocumentsDirectory();
  Hive.init(applicationDirectory.path);
  Hive.registerAdapter(ExpenceAdapter());
  Hive.registerAdapter(BalanceAdapter());
}

Future<void> _initApp() async {
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    print('success firebase init');
    // Initialize RemoteConfigService and wait for it to complete
    // final remoteConfigService = RemoteConfigService();
    // await remoteConfigService.init();

    // Fetch API key from Remote Config
    // remoteConfigService.getString(ConfigKey.newsApiKey);

    // Set up error handling
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } on Exception catch (e) {
    log("Failed to initialize Firebase: $e" as num);
  }

  await initHive();
  await di.init();
}

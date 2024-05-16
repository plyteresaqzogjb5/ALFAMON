import 'package:flutter/material.dart';
import 'package:pp_14_copy/feature/app/currency/pages/currency_page.dart';
import 'package:pp_14_copy/feature/app/main_page.dart';
import 'package:pp_14_copy/feature/app/news/pages/news_page.dart';
import 'package:pp_14_copy/feature/app/no_connection.dart';
import 'package:pp_14_copy/feature/app/onboring/onb_page.dart';
import 'package:pp_14_copy/feature/app/settings/pages/contact_us_page.dart';
import 'package:pp_14_copy/feature/app/settings/pages/privacy_page.dart';
import 'package:pp_14_copy/feature/app/settings/pages/terms_page.dart';
import 'package:pp_14_copy/feature/app/splash.dart';

import 'route_names.dart';

typedef ScreenBuilding = Widget Function(BuildContext context);

class Routes {
  static Map<String, ScreenBuilding> get(BuildContext context) {
    return {
      RouteNames.splash: (context) => const SplashView(),
      RouteNames.onboarding: (context) => const OnboardingScreen(),
      RouteNames.home: (context) => const MainPageWidget(),
      RouteNames.noConnection: (context) => NoConnectionView(),
      RouteNames.privacy: (context) => const PrivacyPagesWidget(),
      RouteNames.terms: (context) => const TermsPagesWidget(),
      RouteNames.news: (context) => const NewsPageWidget(),
      RouteNames.currency: (context) => CurrencyPageWidget(isSettings: false),
      RouteNames.contactDeveloper: (context) => const ContactUsPageWidget(),
    };
  }
}

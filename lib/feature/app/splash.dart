import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_14_copy/common/helpers/dialog_helper.dart';
import 'package:pp_14_copy/feature/app/main_page.dart';
import 'package:pp_14_copy/feature/app/onboring/onb_page.dart';
import 'package:pp_14_copy/feature/app/settings/pages/privacy_page.dart';
import 'package:pp_14_copy/feature/services/remote_config_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_review/in_app_review.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _connectivity = Connectivity();
  late bool usePrivacyAgreement;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await _initConnectivity(
      () async => await DialogHelper.showNoInternetDialog(context),
    );

    _navigate();
  }

  Future<void> _initConnectivity(Future<void> Function() callback) async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        await callback.call();
        return;
      }
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }
  }

  void _navigate() async {
    FlutterNativeSplash.remove();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seen = prefs.getBool('seenOnboarding');
    bool? privacySeen = prefs.getBool('acceptPrivacy');

    if (seen == null) {
      await prefs.setBool('seenOnboarding', false);
      seen = false;
    }

    if (privacySeen == null) {
      await prefs.setBool('acceptPrivacy', false);
      privacySeen = false;
    }

      if (!seen) {
        await InAppReview.instance.requestReview();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => const OnboardingScreen()));
      } else {
        if (!privacySeen) {
          await prefs.setBool('acceptPrivacy', true);
          DialogHelper.showPrivacyAgreementDialog(
            context,
            yes: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const PrivacyPagesWidget())),
            no: () => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => const MainPageWidget())),
          );
        } else {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => const MainPageWidget()));
        }
      }


  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

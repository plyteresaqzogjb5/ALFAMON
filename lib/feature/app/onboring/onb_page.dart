import 'package:flutter/material.dart';
import 'package:pp_14_copy/common/styles/const_theme/colors.dart';
import 'package:pp_14_copy/feature/app/main_page.dart';
import 'package:pp_14_copy/feature/app/onboring/onb_1.dart';
import 'package:pp_14_copy/feature/app/onboring/onb_2.dart';
import 'package:pp_14_copy/feature/app/onboring/onb_3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<Widget> onboardingPages = [
    const OneOnboardingPage(),
    const SecondOnboardingPage(),
    const ThreeOnboardingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackbackground,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return onboardingPages[index];
        },
      ),
      floatingActionButton: IconButton(
          icon: const Icon(Icons.keyboard_arrow_right, size: 60, color: AppColors.cardColor),
          onPressed: _currentPage == 0 || _currentPage == 1
              ? () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              : () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();

                  await prefs.setBool('seenOnboarding', true);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const MainPageWidget()));
                }),
    );
  }
}

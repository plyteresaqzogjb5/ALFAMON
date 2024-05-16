import 'package:flutter/material.dart';
import 'package:pp_14_copy/common/styles/const_theme/colors.dart';

class ThreeOnboardingPage extends StatelessWidget {
  const ThreeOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF99C8FF),
            Color(0xFF5CA7FF),
            Color(0xFF1353F8),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Image.asset(
                'assets/images/onb3.png',
                alignment: Alignment.centerRight,
                height: 0.59 * MediaQuery.of(context).size.height,
                width: 1.05 * MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Read about countries and travel',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 32,
                        color: AppColors.whitebackground,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

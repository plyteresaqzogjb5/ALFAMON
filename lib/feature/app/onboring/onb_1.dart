import 'package:flutter/material.dart';
import 'package:pp_14_copy/common/styles/const_theme/colors.dart';

class OneOnboardingPage extends StatelessWidget {
  const OneOnboardingPage({super.key});

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
          // stops: [0.14, 0.6886, 0.9878],
          // transform: GradientRotation(349.65 * pi / 180),
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
                'assets/images/onb1.png',
                alignment: Alignment.centerRight,
                height: 0.5 * MediaQuery.of(context).size.height,
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
                  'Keep track of your expenses and income',
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

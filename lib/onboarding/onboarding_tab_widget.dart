import 'package:flutter/material.dart';
import 'package:islami_application/theme/app_colors.dart';

class OnboardingTabWidget extends StatelessWidget {
  const OnboardingTabWidget({
    super.key,
    required this.imagePath,
    required this.title,
    this.brief,
  });

  final String imagePath;
  final String title;
  final String? brief;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        spacing: 30,
        children: [
          Image.asset(
            'assets/images/onboarding/islami_application.png',
            height: MediaQuery.of(context).size.height * 0.18,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath)),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.goldColor,
              fontFamily: 'poppins',
            ),
          ),
          brief != null
              ? Text(
                textAlign: TextAlign.center,
                brief!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.goldColor,
                  fontFamily: 'poppins',
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

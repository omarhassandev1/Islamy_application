import 'package:auto_size_text/auto_size_text.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 30,
        children: [
          Image.asset(
            'assets/images/onboarding/islami_header.png',
            height: MediaQuery.of(context).size.height * 0.18,
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              spacing: 10,
              children: [
                FittedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.goldColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
                brief != null
                    ? Expanded(
                      child: AutoSizeText(
                        textAlign: TextAlign.center,
                        minFontSize: 16,
                        maxLines: 3,
                        brief!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.goldColor,
                          fontFamily: 'poppins',
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

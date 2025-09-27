import 'package:flutter/material.dart';
import 'package:islami_application/onboarding/onbording_data.dart';
import 'package:islami_application/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/main_layer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routName = 'onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  Future<void> completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    Navigator.of(context).pushReplacementNamed(MainLayer.routName);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              controller: _controller,
              itemCount: OnboardingData.tabs.length,
              itemBuilder: (context, index) {
                return OnboardingData.tabs[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentPage != 0
                    ? TextButton(
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                        ),
                      ),
                    )
                    : const SizedBox(width: 70),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    OnboardingData.tabs.length,
                    (index) => buildDot(index: index),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    if (currentPage == OnboardingData.tabs.length - 1) {
                      completeOnboarding();
                      return;
                    }

                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    currentPage != OnboardingData.tabs.length - 1
                        ? "Next"
                        : 'Finish',
                    style: TextStyle(color: AppColors.goldColor, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: currentPage == index ? 25 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.goldColor : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

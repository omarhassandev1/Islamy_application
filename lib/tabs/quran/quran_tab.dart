import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppColors.blackColor]),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/onboarding/islami_application.png',
              ),
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/onboarding/islami_application.png',
                height: MediaQuery.of(context).size.height * 0.18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

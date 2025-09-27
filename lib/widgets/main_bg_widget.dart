import 'package:flutter/material.dart';
import 'package:islami_application/widgets/main_header.dart';

import '../theme/app_colors.dart';

class MainBgWidget extends StatelessWidget {
  const MainBgWidget({super.key, required this.bgImage, required this.child});

  final String bgImage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.blackColor.withValues(alpha: .7),
              AppColors.blackColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [MainHeader(), child],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami_application/common/app_consts.dart';
import 'package:islami_application/theme/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      color: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.goldColor, size: 24),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'poppins',
        color: AppColors.goldColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      scrolledUnderElevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blackColor,
      primary: AppColors.blackColor,
      secondary: AppColors.goldColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.goldColor,
      selectedIconTheme: IconThemeData(color: AppColors.offWhiteColor),
      unselectedIconTheme: IconThemeData(color: AppColors.blackColor),
      selectedItemColor: AppColors.offWhiteColor,
      unselectedItemColor: AppColors.blackColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontFamily: AppConsts.fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

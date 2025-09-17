import 'package:flutter/material.dart';
import 'package:islami_application/screens/main_layer.dart';
import 'package:islami_application/tabs/quran/sura_details.dart';
import 'package:islami_application/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      title: 'Islamy application',
      debugShowCheckedModeBanner: false,
      initialRoute: seenOnboarding ? MainLayer.routName : OnboardingScreen.routName,
      routes: {
        MainLayer.routName: (context) => MainLayer(),
        SuraDetails.routName: (context) => SuraDetails(),
        OnboardingScreen.routName: (context) => OnboardingScreen(),
      },
    );
  }
}

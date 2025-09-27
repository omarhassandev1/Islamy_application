import 'package:islami_application/onboarding/onboarding_tab_widget.dart';

class OnboardingData {
  static List<OnboardingTabWidget> tabs = [
    const OnboardingTabWidget(
      imagePath: 'assets/images/onboarding/welcome.png',
      title: 'Welcome To Islami App',
    ),
    const OnboardingTabWidget(
      imagePath: 'assets/images/onboarding/kabba.png',
      title: 'Welcome To Islami',
      brief: 'We Are Very Excited To Have You In Our Community',
    ),
    const OnboardingTabWidget(
      imagePath: 'assets/images/onboarding/reading.png',
      title: 'Reading the Quran',
      brief: 'Read, and your Lord is the Most Generous',
    ),
    const OnboardingTabWidget(
      imagePath: 'assets/images/onboarding/bearish.png',
      title: 'Bearish',
      brief: 'Praise the name of your Lord, the Most High',
    ),
    const OnboardingTabWidget(
      imagePath: 'assets/images/onboarding/radio.png',
      title: 'Holy Quran Radio',
      brief:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
}

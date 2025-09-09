import 'package:flutter/material.dart';
import 'package:islami_application/screens/main_layer.dart';
import 'package:islami_application/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      title: 'Islamy application',
      debugShowCheckedModeBanner: false,
      initialRoute: 'mainLayer',
      routes: {
        'mainLayer' : (context) => MainLayer()
      },
    );
  }
}

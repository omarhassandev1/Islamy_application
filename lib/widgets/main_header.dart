import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset(
        'assets/images/onboarding/islami_header.png',
        // height: MediaQuery.of(context).size.height * 0.18,
        height: 140,
        width: 300,
      ),
    );
  }
}

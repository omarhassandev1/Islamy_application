import 'package:flutter/material.dart';

import '../widgets/radio_card.dart';


class RecitersListView extends StatelessWidget {
  const RecitersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: radioNames.length,
        itemBuilder: (context, index) {
          return RadioCard(title: radioNames[index],);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }

  List<String> get radioNames {
    return [
      'Ibrahim Al-Akdar',
      'Akram Alalaqmi',
      'Majed Al-Enezi',
      'Malik shaibat Alhamed',
    ];
  }
}

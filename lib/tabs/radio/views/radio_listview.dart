import 'package:flutter/material.dart';

import '../widgets/radio_card.dart';

class RadioListview extends StatelessWidget {
  const RadioListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: radioNames.length,
        itemBuilder: (context, index) {
          return RadioCard(title: radioNames[index],);
        },
        separatorBuilder: (context, index) => SizedBox(height: 16),
      ),
    );
  }

  List<String> get radioNames {
    return [
      'Radio Ibrahim Al-Akdar',
      'Radio Al-Qaria Yassen',
      'Radio Ahmed Al-trabulsi',
      'Radio Addokali Mohammad Alalim',
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:islami_application/tabs/radio/views/radio_listview.dart';
import 'package:islami_application/tabs/radio/views/reciters_listview.dart';
import 'package:islami_application/tabs/radio/widgets/radioHeader.dart';
import 'package:islami_application/tabs/radio/widgets/radioHeaderElement.dart';
import 'package:islami_application/widgets/main_bg_widget.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final List<Widget> views = const [RadioListview(), RecitersListView()];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
        bgImage: 'assets/images/radio/radio-background.png',
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                RadioHeader(
                  children: [
                    RadioHeaderElement(
                      title: "Radio",
                      isSelected: selectedTab == 0,
                      onTap: () => setState(() => selectedTab = 0),
                    ),
                    RadioHeaderElement(
                      title: "Reciters",
                      isSelected: selectedTab == 1,
                      onTap: () => setState(() => selectedTab = 1),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(child: views[selectedTab]),
              ],
            ),
          ),
        ),
      
    );
  }
}

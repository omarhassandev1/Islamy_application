import 'package:flutter/material.dart';
import 'package:islami_application/tabs/quran/views/most_recent_view.dart';
import 'package:islami_application/tabs/quran/views/suras_list_view.dart';
import 'package:islami_application/tabs/quran/widgets/custom_textfield.dart';
import 'package:islami_application/widgets/main_bg_widget.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MainBgWidget(
        bgImage: 'assets/quran_background.png',
        child: Expanded(
          child: Column(
            spacing: 20,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  onChanged: (text) {
                    setState(() {
                      searchText = text;
                    });
                  },
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        MostRecentView(),
                        SurasListView(
                          searchText: searchText,
                          onNavigation: () {
                            setState(() {});
                          },
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami_application/tabs/quran/views/most_recent_view.dart';
import 'package:islami_application/tabs/quran/views/suras_list_view.dart';
import 'package:islami_application/tabs/quran/widgets/custom_textfield.dart';
import 'package:islami_application/widgets/main_bg_widget.dart';

import '../../theme/app_colors.dart';
import '../../widgets/main_header.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

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
                child: CustomTextField(),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        MostRecentView(),
                        SurasListView(),
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

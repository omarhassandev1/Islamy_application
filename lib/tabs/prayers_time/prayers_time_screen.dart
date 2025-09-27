import 'package:flutter/material.dart';
import 'package:islami_application/tabs/prayers_time/widgets/azkar_widget.dart';
import 'package:islami_application/tabs/prayers_time/widgets/times_widget.dart';
import 'package:islami_application/tabs/prayers_time/classes/zekr_class.dart';
import 'package:islami_application/widgets/main_bg_widget.dart';

class PrayersTimeScreen extends StatelessWidget {
  const PrayersTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return MainBgWidget(
      bgImage: 'assets/images/prayers_time/prayers_background.png',
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TimesWidget(),

                const SizedBox(height: 24),

                const Text(
                  "Azkar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2/3
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    ZekrCategory zekrCategory = ZekrCategory.azkarCategories[index];
                    return AzkarWidget(zekr: zekrCategory,);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

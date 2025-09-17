import 'package:flutter/material.dart';
import 'package:islami_application/theme/app_colors.dart';
import 'package:islami_application/widgets/main_bg_widget.dart';

import '../../widgets/main_header.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 1,
  );

  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      if (controller.page != currentPage) {
        setState(() {
          currentPage = (controller.page ?? 0).toInt();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: 'assets/hadith_background.png',
      child: Expanded(
        child: PageView.builder(
          controller: controller,
          itemBuilder:
              (context, index) => Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: index != currentPage ? 20 : 0,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  padding: EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/hadith_card_image.png',
                        fit: BoxFit.fill,
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          SizedBox(height: 42),
                          Text(
                            'data',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                          ),
                          Text(
                            'data',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}

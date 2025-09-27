import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/models/hadeeth_model.dart';
import 'package:islami_application/tabs/hadith/hadith_details.dart';
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

  List<HadeethModel> allHadeeth = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

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
    loadAhadeeth();
  }

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: 'assets/hadith_background.png',
      child: Expanded(
        child: PageView.builder(
          controller: controller,
          itemCount: allHadeeth.length,
          itemBuilder: (context, index) {
            HadeethModel hadeeth = allHadeeth[index];
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(HadeethDetails.routName,arguments: hadeeth);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
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
                        opacity: AlwaysStoppedAnimation(.5),
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          SizedBox(height: 42),
                          Text(
                            hadeeth.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 50,
                            ),
                              child: SingleChildScrollView(
                                child: Text(
                                  hadeeth.content,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void loadAhadeeth() async {
    List<HadeethModel> ahadeeth = [];
    for (int i = 1; i < 51; i++) {
      String hadeeth = await rootBundle.loadString(
        'assets/files/Hadeeth/h$i.txt',
      );
      String title = hadeeth.split('\n').first;
      String content = hadeeth.substring(title.length + 1);
      ahadeeth.add(HadeethModel(title: title, content: content, index: i));
    }
    setState(() {
      allHadeeth = ahadeeth;
    });
  }
}

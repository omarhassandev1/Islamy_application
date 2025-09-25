import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_application/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/sura_model.dart';

class MostRecentView extends StatefulWidget {
  const MostRecentView({super.key});

  @override
  State<MostRecentView> createState() => _MostRecentViewState();
}

class _MostRecentViewState extends State<MostRecentView> {
  List<SuraModel> mostRecent = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMostRecent();
  }

  @override
  void didUpdateWidget(covariant MostRecentView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    loadMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Most recently',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        mostRecent.isEmpty
            ? Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.goldColor, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          'assets/svg/empty.svg',
                          colorFilter: ColorFilter.mode(
                            AppColors.goldColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'No recent suras found !',
                          style: TextStyle(
                            color: AppColors.goldColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            : Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 20),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: mostRecent.length,
                  itemBuilder: (context, index) {
                    SuraModel sura = mostRecent[index];
                    return SizedBox(
                      width: 280,
                      child: Card(
                        color: AppColors.goldColor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 7.0,
                            right: 7,
                            bottom: 7,
                            left: 20,
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sura.enName,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      sura.arName,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${sura.versesCount} verses',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                right: 0,
                                child: Image.asset(
                                  'assets/images/surahImage.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
      ],
    );
  }

  loadMostRecent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> data = prefs.getStringList('mostRecent') ?? [];
    print('---------->$data');
    List<SuraModel> mostRecentSuras =
        data.map((e) => SuraModel.getSurasList[int.parse(e) - 1]).toList();
    setState(() {
      mostRecent = mostRecentSuras.reversed.toList();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:islami_application/theme/app_colors.dart';

class MostRecentView extends StatelessWidget {
  const MostRecentView({super.key});
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
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            height: 150,
            child: ListView.builder(
              itemBuilder:
                  (context, index) => SizedBox(
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
                                    'Al-Anbiya',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'الأنبياء',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '112 verses',
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
                  ),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}

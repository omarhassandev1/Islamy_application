import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_colors.dart';

class RadioCard extends StatelessWidget {
  RadioCard({
    super.key,
    required this.title,
    this.isMute = false,
    this.isPlaying = false,
  });

  final String title;
  bool isPlaying;
  bool isMute;

  @override
  Widget build(BuildContext context) {
    String imagePath = isPlaying? 'assets/images/radio/soundWave 1.png' :'assets/images/radio/Mosque-02.png';
    double cardHeight = MediaQuery.of(context).size.height * 0.15;
    return Container(
      height: cardHeight,
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: cardHeight * 0.7,
            child: Image.asset(
              imagePath,
              opacity: const AlwaysStoppedAnimation(0.4),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  SvgPicture.asset(!isPlaying? 'assets/svg/play.svg': 'assets/svg/pause.svg'),
                  SvgPicture.asset(!isMute? 'assets/svg/sound.svg': 'assets/svg/mute.svg'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

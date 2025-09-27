import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_application/tabs/prayers_time/classes/prayer_class.dart';
import 'package:islami_application/theme/app_colors.dart';

class TimesWidget extends StatefulWidget {
  const TimesWidget({super.key});

  @override
  State<TimesWidget> createState() => _TimesWidgetState();
}

class _TimesWidgetState extends State<TimesWidget> {
  int currentPage = 3;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(viewportFraction: 0.4);
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          SvgPicture.asset('assets/svg/prayers_card.svg', fit: BoxFit.contain),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('16 Jul,\n2024', style: styles),
                    Column(
                      children: [
                        Opacity(
                          opacity: .6,
                          child: Text(
                            'Pray Time',
                            style: styles.copyWith(color: AppColors.blackColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'Tuesday',
                          style: styles.copyWith(color: AppColors.blackColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      '09 Muh,\n1446',
                      style: styles,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: index != currentPage ? 10 : 0,
                      ),
                      child: Container(
                        width: 30,
                        margin: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 4,
                        ),
                        padding: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0.1, 0.7],
                            colors: [
                              AppColors.blackColor,
                              AppColors.gradientBrown,
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Prayer.prayers[index].name,
                              style: styles.copyWith(fontSize: 20),
                            ),
                            Text(
                              Prayer.prayers[index].time,
                              style: styles.copyWith(fontSize: 28),
                            ),
                            Text(
                              Prayer.prayers[index].toMidday,
                              style: styles.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: 0.75,
                          child: Text(
                            'Next Pray - ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '02:32',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/svg/mute2.svg'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle get styles =>
      const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
}

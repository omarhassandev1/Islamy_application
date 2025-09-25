import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/models/sebha_model.dart';
import 'package:islami_application/tabs/sebha/widgets/reset_sebha_button.dart';
import 'package:islami_application/theme/app_colors.dart';
import 'package:islami_application/widgets/main_bg_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<SebhaModel> azkar = SebhaModel.azkar;
  int current = 0;
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBgWidget(
        bgImage: 'assets/images/sebha/sebha_background.png',
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                FittedBox(
                  child: Text(
                    azkar[current].ayah,
                    style: _sebhaTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: increment,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/Group 39.png'),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8,
                          children: [
                            const SizedBox(height: 70),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 80.0,
                              ),
                              child: AutoSizeText(
                                azkar[current].zekr,
                                style: _sebhaTextStyle,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                            Text(counter.toString(), style: _sebhaTextStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: ResetSebhaButton(
              resetSebha: () {
                _resetButtonLogic(_resetSebha);
              },
            ),
          ),

          FloatingActionButton(
            onPressed: increment,
            backgroundColor: AppColors.goldColor,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void increment() {
    if (counter < 5) {
      setState(() {
        counter++;
      });
    } else if (counter == 5) {
      setState(() {
        counter = 0;
        if (current < azkar.length - 1) {
          current++;
        } else if (current == azkar.length - 1) {
          current = 0;
        }
      });
    }
    _saveValues();
    print('-------------------------');
    print('------> counter: $counter');
    print('------> current: $current');
    print('-------------------------');
  }

  Future<void> _loadValues() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      current = prefs.getInt('current') ?? 0;
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _saveValues() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('current', current);
    await prefs.setInt('counter', counter);
  }

  void _resetButtonLogic(void Function() reset) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(color: AppColors.blackColor),
          child: SafeArea(
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  "هل أنت متأكد أنك تريد تصفير للسبحة؟",
                  style: _sebhaTextStyle.copyWith(
                    fontSize: 32
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.greyColor,
                            padding: EdgeInsets.all(12),
                          ),
                          child: Text(
                            'cancel',
                            style: _sebhaTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            reset();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.goldColor,
                            padding: EdgeInsets.all(12),
                          ),
                          child: Text(
                            'reset',
                            style: _sebhaTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _resetSebha() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      current = 0;
      counter = 0;
    });
    await prefs.setInt('current', 0);
    await prefs.setInt('counter', 0);
  }

  TextStyle get _sebhaTextStyle => const TextStyle(
    fontWeight: FontWeight.bold,
    color:
        Colors
            .white, // Using Colors.white as fallback for AppColors.offWhiteColor
    fontSize: 38,
  );
}

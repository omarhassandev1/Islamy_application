import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/models/hadeeth_model.dart';
import 'package:islami_application/models/sura_model.dart';

import '../../theme/app_colors.dart';

class HadeethDetails extends StatefulWidget {
  const HadeethDetails({super.key});

  static const String routName = 'hadeethDetails';

  @override
  State<HadeethDetails> createState() => _HadeethDetailsState();
}

class _HadeethDetailsState extends State<HadeethDetails> {
  @override
  Widget build(BuildContext context) {
    final HadeethModel hadeeth =
        ModalRoute.of(context)!.settings.arguments as HadeethModel;

    return Scaffold(
      appBar: AppBar(title: Text('Hadeeth ${hadeeth.index}')),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/sura_details_bg.png', fit: BoxFit.fill),
          Column(
            children: [
              SizedBox(height: 16),
              SizedBox(height: 16),
              Text(
                hadeeth.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.goldColor,
                ),
              ),
              SizedBox(height: 42),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    hadeeth.content,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.goldColor,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }

}

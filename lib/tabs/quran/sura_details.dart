import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/models/sura_model.dart';

import '../../theme/app_colors.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  static const String routName = 'suraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayatList = [];

  @override
  Widget build(BuildContext context) {
    final SuraModel suraModel =
    ModalRoute.of(context)!.settings.arguments as SuraModel;

    loadSura(suraModel.index);

    return Scaffold(
      appBar: AppBar(title: Text(suraModel.enName),),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/sura_details_bg.png', fit: BoxFit.fill),
          Column(
            children: [
              SizedBox(height: 16),
              SizedBox(height: 16),
              Text(
                suraModel.arName,
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
                  child: RichText(
                    text: TextSpan(
                      children: [
                        for(int i=0 ; i<ayatList.length ; i++)
                          TextSpan(text: '${ayatList[i]}(${i+1})  ')
                      ],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColors.goldColor,
                      ),



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

  Future loadSura(int index) async {
    String res = await rootBundle.loadString('assets/files/Suras/$index.txt');

    setState(() {
      ayatList = res.trim().split('\n');
    });
  }
}
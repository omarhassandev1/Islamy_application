import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_application/common/app_consts.dart';
import 'package:islami_application/common/common_designs.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({super.key});

  @override
  State<MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<MainLayer> {
  int currentTab = 0;

  List<Widget> tabs = [
    Container(color: Colors.red,),
    Container(color: Colors.amber,),
    Container(color: Colors.grey,),
    Container(color: Colors.blueAccent,),
    Container(color: Colors.green,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Islamy application')),

      body: tabs[currentTab],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration:
                  currentTab == 0
                      ? CommonDesigns.selectedTabDecoration
                      : null,
              child: SvgPicture.asset(
                AppConsts.quranIcon,
                width: currentTab == 0 ? 20 : 24,
                color: currentTab == 0 ? Colors.white : null,
              ),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration:
                  currentTab == 1
                      ? CommonDesigns.selectedTabDecoration
                      : null,
              child: SvgPicture.asset(
                AppConsts.hadithIcon,
                width: currentTab == 1 ? 20 : 24,
                color: currentTab == 1 ? Colors.white : null,
              ),
            ),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration:
                  currentTab == 2
                      ? CommonDesigns.selectedTabDecoration
                      : null,
              child: SvgPicture.asset(
                AppConsts.sebhaIcon,
                width: currentTab == 2 ? 20 : 24,
                color: currentTab == 2 ? Colors.white : null,
              ),
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration:
                  currentTab == 3
                      ? CommonDesigns.selectedTabDecoration
                      : null,
              child: SvgPicture.asset(
                AppConsts.radioIcon,
                width: currentTab == 3 ? 20 : 24,
                color: currentTab == 3 ? Colors.white : null,
              ),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration:
                  currentTab == 4
                      ? CommonDesigns.selectedTabDecoration
                      : null,
              child: SvgPicture.asset(
                AppConsts.timeIcon,
                width: currentTab == 4 ? 20 : 24,
                color: currentTab == 4 ? Colors.white : null,
              ),
            ),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_application/models/sura_model.dart';
import 'package:islami_application/tabs/quran/sura_details.dart';

import '../../../theme/app_colors.dart';

class SurasListView extends StatelessWidget {
  const SurasListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suras list',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: SuraModel.getSurasList.length,
            itemBuilder: (context, index) {
              List<SuraModel> suras = SuraModel.getSurasList;
              SuraModel currentSura = suras[index];
              return ListTile(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(SuraDetails.routName, arguments: currentSura);
                },
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/suraList.svg'),
                    Text(
                      currentSura.index.toString(),
                      style: TextStyle(
                        fontSize:
                            currentSura.index < 10
                                ? 16
                                : index < 100
                                ? 14
                                : 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  currentSura.enName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${currentSura.versesCount} verses',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  currentSura.arName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              );
            },
            separatorBuilder:
                (context, index) => Divider(
                  indent: 65,
                  endIndent: 65,
                  color: AppColors.goldColor,
                ),
          ),
        ],
      ),
    );
  }
}

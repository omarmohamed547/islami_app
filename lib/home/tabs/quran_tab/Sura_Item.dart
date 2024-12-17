import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/quran_tab/Quran_details.dart';
import 'package:islami_app/models/Sura_model.dart';

class SuraItem extends StatelessWidget {
  String suraArName;
  String suraENName;
  String numOfVerses;
  SuraModel filterList;
  SuraItem({
    required this.filterList,
    required this.numOfVerses,
    required this.suraArName,
    required this.suraENName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, QuranDetails.qurandetailsScreenId,
            arguments: filterList);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primarycolor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  suraENName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  suraArName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  numOfVerses,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.asset("assets/images/quranImage.png")
          ],
        ),
      ),
    );
  }
}

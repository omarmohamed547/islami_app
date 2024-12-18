import 'package:flutter/material.dart';
import 'package:islami_app/utilis/app_colors.dart';
import 'package:islami_app/home/tabs/quran_tab/Quran_details.dart';
import 'package:islami_app/models/Sura_model.dart';
import 'package:islami_app/utilis/app_style.dart';

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, QuranDetails.qurandetailsScreenId,
            arguments: filterList);
      },
      child: Container(
        height: height * 0.17,
        //width: width * .65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primarycolor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  suraENName,
                  style: AppStyle.bold24Black,
                ),
                Text(
                  suraArName,
                  style: AppStyle.bold24Black,
                ),
                Text(
                  "$numOfVerses Verses",
                  style: AppStyle.bold24Black.copyWith(fontSize: 14),
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

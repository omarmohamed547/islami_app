import 'package:flutter/material.dart';
import 'package:islami_app/models/Sura_model.dart';
import 'package:islami_app/utilis/app_style.dart';

class SuraListItem extends StatelessWidget {
  int index;
  SuraListItem({
    required this.suraModelobj,
    required this.index,
    super.key,
  });

  SuraModel suraModelobj;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/GroupsuranNum.png"),
            Text(
              "${index + 1}",
              style: AppStyle.bold20White,
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("${suraModelobj.suraEnglishName}",
                      style: AppStyle.bold20White),
                  Text(
                    "${suraModelobj.numOfVerse} Verses",
                    style: AppStyle.bold20White,
                  ),
                ],
              ),
              Text(
                "${suraModelobj.suraArabicName}",
                style: AppStyle.bold20White,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

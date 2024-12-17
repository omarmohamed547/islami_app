import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/quran_tab/Sura_Item.dart';
import 'package:islami_app/models/Sura_model.dart';

class MostRecentlyItem extends StatelessWidget {
  String suraArName;
  String suraENName;
  String numOfVerses;
  SuraModel filterList;

  MostRecentlyItem(
      {required this.filterList,
      required this.numOfVerses,
      required this.suraArName,
      required this.suraENName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        SuraItem(
          suraArName: suraArName,
          suraENName: suraENName,
          numOfVerses: numOfVerses,
          filterList: filterList,
        ),
      ],
    );
  }
}

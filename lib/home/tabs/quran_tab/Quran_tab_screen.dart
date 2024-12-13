import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/quran_tab/Quran_details.dart';
import 'package:islami_app/models/Sura_model.dart';

import 'Sura_Item.dart';
import 'Sura_list_Item.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/appQuranTabimage.png"),
          TextField(
            decoration: InputDecoration(
                prefixIcon:
                    Image.asset("assets/images/quran-svgrepo-com 1.png"),
                hintText: "Sura Name",
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primarycolor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)))),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Most Recently",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          SuraItem(),
          SizedBox(
            height: 15,
          ),
          Text(
            "Sura List",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: SuraModel.AyaNumber.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, QuranDetails.qurandetailsScreenId,
                        arguments: SuraModel.getsuramodelobj(index));
                  },
                  child: SuraListItem(
                    suraModelobj: SuraModel.getsuramodelobj(index),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 2,
                  color: Colors.white,
                  indent: 30.5,
                  endIndent: 25.5,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

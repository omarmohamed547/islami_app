import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/models/Hadith_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Hadith_details.dart';

class HadithTab extends StatefulWidget {
  HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    return Container(
        child: Column(
      children: [
        Image.asset("assets/images/Logohadith.png"),
        CarouselSlider.builder(
          options: CarouselOptions(
              height: 500.0,
              viewportFraction: 0.75,
              initialPage: 0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true),
          itemCount: hadithList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
            onTap: () {
              Navigator.pushNamed(context, HadithDetails.hadithdetailsScreenId,
                  arguments: hadithList[itemIndex]);
            },
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.primarycolor,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage("assets/images/HdithshowBackground.png")),
                ),
                child: hadithList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primarycolor,
                      ))
                    : Column(
                        children: [
                          Text(
                            hadithList[itemIndex].title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Text(
                            hadithList[itemIndex].content.join(''),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                        ],
                      )),
          ),
        ),
      ],
    ));
  }

  void loadHadithFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString("assets/files/Hadeeth/h$i.txt");
      List<String> hadithLines = hadithContent.split('\n');
      String title = hadithLines[0];
      hadithLines.removeAt(0);
      HadithModel hadithModel = HadithModel(content: hadithLines, title: title);
      hadithList.add(hadithModel);
      setState(() {});
    }
  }
}

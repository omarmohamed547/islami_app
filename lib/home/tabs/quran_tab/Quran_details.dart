import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/utilis/app_colors.dart';
import 'package:islami_app/home/tabs/quran_tab/Sura_conteent.dart';
import 'package:islami_app/models/Sura_model.dart';
import 'package:islami_app/utilis/app_style.dart';

class QuranDetails extends StatefulWidget {
  static const String qurandetailsScreenId = "QuranDetails";

  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(arg.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arg.suraEnglishName,
          style: TextStyle(color: AppColors.primarycolor, fontSize: 24),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.primaryBlackcolor,
            child: Image.asset(
              "assets/images/qurandetailsBackground.png",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                arg.suraArabicName,
                style: AppStyle.bold20Primary.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primarycolor,
                      ))
                    : ListView.builder(
                        itemCount: verses.length,
                        itemBuilder: (context, index) {
                          return SuraConteent(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            isSelected: index == selectedIndex,
                            content: verses[index],
                            index: index,
                          );
                        }),
              )
            ],
          )
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString("assets/files/Suras/$fileName");
    List<String> suraLines = suraContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines[i]);
    }
    verses = suraLines;
    setState(() {});
  }
}

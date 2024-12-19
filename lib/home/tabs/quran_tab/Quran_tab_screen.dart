import 'package:flutter/material.dart';
import 'package:islami_app/utilis/app_colors.dart';
import 'package:islami_app/home/tabs/quran_tab/Quran_details.dart';
import 'package:islami_app/home/tabs/quran_tab/most_recently_item.dart';
import 'package:islami_app/models/Sura_model.dart';
import 'package:islami_app/utilis/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Sura_Item.dart';
import 'Sura_list_Item.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void add() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          fileName: "${i + 1}.txt",
          numOfVerse: SuraModel.AyaNumber[i],
          suraArabicName: SuraModel.arabicAuranSuras[i],
          suraEnglishName: SuraModel.englishQuranSurahs[i]));
    }
  }

  String searchText = '';
  Map<String, dynamic> lastSuraMap = {};
  List<SuraModel> filterList = SuraModel.suraList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    add();
    WidgetsFlutterBinding.ensureInitialized();

    loadLastSura();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/appQuranTabimage.png"),
          TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              searchText = value;
              filterList = SuraModel.suraList.where((sura) {
                return sura.suraArabicName.contains(searchText) ||
                    sura.suraEnglishName
                        .toLowerCase()
                        .contains(value.toLowerCase());
              }).toList();
              setState(() {});
            },
            decoration: InputDecoration(
                prefixIcon:
                    Image.asset("assets/images/quran-svgrepo-com 1.png"),
                hintText: "Sura Name",
                hintStyle: AppStyle.bold20White.copyWith(fontSize: 16),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primarycolor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)))),
          ),
          SizedBox(
            height: 20,
          ),
          searchText.isEmpty
              ? MostRecentlyItem(
                  suraArName: lastSuraMap["suraArName"] ?? "",
                  suraENName: lastSuraMap["suraEnName"] ?? "",
                  numOfVerses: lastSuraMap["numOfVerses"] ?? "",
                  filterList: filterList[lastSuraMap["index"] ?? 0],
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 15,
          ),
          Text(
            "Sura List",
            style: AppStyle.bold20White.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveLastSura(
                        // fileName: filterList[index].fileName,
                        suraArName: filterList[index].suraArabicName,
                        suraEnName: filterList[index].suraEnglishName,
                        numOfVerses: filterList[index].numOfVerse,
                        index:
                            (SuraModel.reurnIndexFileName(filterList[index])) -
                                1);
                    /* Future.delayed(Duration(seconds: 2), () async {
                      await loadLastSura();
                    });*/
                    Navigator.pushNamed(
                        context, QuranDetails.qurandetailsScreenId,
                        arguments: filterList[index]);
                  },
                  child: SuraListItem(
                    index: index,
                    suraModelobj: filterList[index],
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

  Future<void> saveLastSura(
      {required String suraArName,
      required String suraEnName,
      // required String fileName,
      required String numOfVerses,
      required int index}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('numOfVerses', numOfVerses);
    await prefs.setInt('index', index);

    await loadLastSura();
  }

  Future<Map<String, dynamic>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      "suraArName": prefs.getString("suraArName") ?? "",
      "suraEnName": prefs.getString("suraEnName") ?? "",
      "numOfVerses": prefs.getString("numOfVerses") ?? "",
      // "fileName": prefs.getString("fileName") ?? "",
      "index": prefs.getInt("index") ?? 0,
    };
  }

  loadLastSura() async {
    lastSuraMap = await getLastSura();
    setState(() {});
  }
}

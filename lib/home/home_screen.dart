import 'package:flutter/material.dart';
import 'package:islami_app/utilis/app_colors.dart';
import 'package:islami_app/home/tabs/Hadith_tab/Hadith_tab.dart';
import 'package:islami_app/home/tabs/quran_tab/Quran_tab_screen.dart';
import 'package:islami_app/home/tabs/radio_tab/Radio_tab.dart';
import 'package:islami_app/home/tabs/sebha_tab/Sebha_tab.dart';
import 'package:islami_app/home/tabs/Time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String homeScreenID = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List backgroundimages = [
    "assets/images/QuranBackground.png",
    "assets/images/hadethBackground.png",
    "assets/images/SebhaBackground.png",
    "assets/images/radioBackground.png",
    "assets/images/TimeBackground.png"
  ];

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.asset(
          backgroundimages[selectedIndex],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primarycolor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                // type: BottomNavigationBarType.fixed,
                // backgroundColor: AppColors.primarycolor,
                showSelectedLabels: true,
                selectedItemColor: Colors.white,
                selectedLabelStyle: TextStyle(color: Colors.white),
                unselectedItemColor: Colors.black,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      icon: returnIconTab(0, "quran", height), label: "Quran"),
                  BottomNavigationBarItem(
                      icon: returnIconTab(1, "hadeth", height),
                      label: "hadeth"),
                  BottomNavigationBarItem(
                      icon: returnIconTab(2, "sebha", height), label: "Sebha"),
                  BottomNavigationBarItem(
                      icon: returnIconTab(3, "radio-svgrepo-com 1", height),
                      label: "Radio"),
                  BottomNavigationBarItem(
                      icon: returnIconTab(4, "time", height), label: "time")
                ]),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  Widget returnIconTab(int index, String image, double height) {
    return selectedIndex == index
        ? Container(
            height: height * 0.036,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0x99202020),
              borderRadius: BorderRadius.circular(66),
            ),
            child: Image.asset(
              "assets/images/$image.png",
              color: Color(0xffFFFFFF),
            ),
          )
        : Image.asset("assets/images/$image.png");
  }
}

import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/tabs/Hadith_tab.dart';
import 'package:islami_app/home/tabs/Quran_tab.dart';
import 'package:islami_app/home/tabs/Radio_tab.dart';
import 'package:islami_app/home/tabs/Sebha_tab.dart';
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
    return Stack(
      children: [
        Image.asset(
          backgroundimages[selectedIndex],
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.primarycolor,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: returnIconTab(0, "quran"), label: "Quran"),
                BottomNavigationBarItem(
                    icon: returnIconTab(1, "hadeth"), label: "hadeth"),
                BottomNavigationBarItem(
                    icon: returnIconTab(2, "sebha"), label: "Sebha"),
                BottomNavigationBarItem(
                    icon: returnIconTab(3, "radio-svgrepo-com 1"),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: returnIconTab(4, "time"), label: "time")
              ]),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  Widget returnIconTab(int index, String image) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0x99202020),
              borderRadius: BorderRadius.circular(66),
            ),
            child: Image.asset("assets/images/$image.png"),
          )
        : Image.asset("assets/images/$image.png");
  }
}

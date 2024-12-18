import 'package:flutter/material.dart';
import 'package:islami_app/utilis/ThemeApp.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home/tabs/Hadith_tab/Hadith_details.dart';
import 'home/tabs/quran_tab/Quran_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeDataApp.darktheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.homeScreenID,
      routes: {
        HomeScreen.homeScreenID: (context) => HomeScreen(),
        QuranDetails.qurandetailsScreenId: (context) => QuranDetails(),
        HadithDetails.hadithdetailsScreenId: (context) => HadithDetails()
      },
    );
  }
}

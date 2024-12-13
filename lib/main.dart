import 'package:flutter/material.dart';
import 'package:islami_app/ThemeApp.dart';
import 'package:islami_app/home/home_screen.dart';

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
      routes: {HomeScreen.homeScreenID: (context) => HomeScreen()},
    );
  }
}

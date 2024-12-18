import 'package:flutter/material.dart';
import 'package:islami_app/utilis/app_colors.dart';

class ThemeDataApp {
  static final ThemeData darktheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.primaryBlackcolor,
          iconTheme: IconThemeData(color: AppColors.primarycolor, size: 24)));
}

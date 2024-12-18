import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/utilis/app_colors.dart';

class AppStyle {
  static TextStyle bold20White = GoogleFonts.elMessiri(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle bold24Black = GoogleFonts.elMessiri(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

  static TextStyle bold20Primary = GoogleFonts.elMessiri(
      color: AppColors.primarycolor, fontSize: 20, fontWeight: FontWeight.bold);
}

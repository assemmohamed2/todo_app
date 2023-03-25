import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

 Color mainColor = HexColor("#113c63");
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class AppColors{
  static const Color shadowColor = Color(0xFFe8e8e8);
  static const Color redShadeColor = Color(0xFF9c677d);
  static const Color salmonColor = Color(0xFFef8076);
  static const Color greenShadeColor = Color(0xFF667b51);
  static const Color blueShadeColor = Color(0xFF5871b6);


}
class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
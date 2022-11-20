import 'package:flutter/material.dart';

class MyColors {
  static const Color backgroundColor = Colors.grey;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color redColor = Color(0xFFDE2D41);
  static const Color greyColor = Color(0xFF545454);
  static const Color greyAccent = Color(0xFFA6A6A6);
  static const Color greyMediumColor = Color(0xFFC6C5CA);
  static const Color lightGreyColor = Color(0xFFF0EFF5);
  static const Color extraLightGreyColor = Color(0xFFF3F3F3);

  static const Gradient blackGradiant = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
      ]);
  static const Gradient blackGradiant1 = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black,
      ]);
  static const Gradient blackGradiant2 = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black,
      ]);
}

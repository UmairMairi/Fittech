import 'package:flutter/material.dart';

class MyColors {
  static const Color backgroundColor = Color(0xFFF3F3F3);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greenColor = Colors.green;
  static const Color redColor = Color(0xFFDE2D41);
  static const Color greyColor = Color(0xFF545454);
  static const Color greyAccent = Color(0xFFA6A6A6);
  static const Color greyBorderColor = Color(0xFFC0BFC2);
  static const Color greyMediumColor = Color(0xFFC6C5CA);
  static const Color lightGreyColor = Color(0xFFF0EFF5);
  static const Color extraLightGreyColor = Color(0xFFF3F3F3);


  static const Color shimmerBaseColor =  Color(0xFFEAEAEA);
  static const Color shimmerBaseColor2 =  Color(0xFFD4D4D4);
  static const Color shimmerHighlightColor =  Color(0xFFF5F5F5);


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

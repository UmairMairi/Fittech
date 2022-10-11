import 'package:flutter/material.dart';

class MyColors {
  static const Color backgroundColor = Colors.grey;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color redColor = Color(0xFFDE2D41);
  static const Color greyColor = Color(0xFF545454);

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
}

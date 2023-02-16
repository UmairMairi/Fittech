import 'package:flutter/material.dart';

extension StringExtension on String {
  // String capitalize() {
  //   return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  // }

  bool isEmail() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(this);
  }

  String removeSpace() {
    var finalString = replaceAll(" ", "");
    return finalString;
  }

  String capitalizeFirst() {
    if (this == "") return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }



  bool get containsUppercase => contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => contains(RegExp(r'[a-z]'));

  bool get containsNumber => contains(RegExp(r'[0-9]'));
}

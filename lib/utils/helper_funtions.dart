import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:flutter/material.dart';

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}

showMessage({required BuildContext context, required String msg}) {
  var snackBar = SnackBar(
    content: Text(
      msg,
      style: MyTextStyle.paragraph1.copyWith(color: MyColors.whiteColor),
    ),
    behavior: SnackBarBehavior.floating,
    elevation: 6.0,
    backgroundColor: Colors.black.withOpacity(0.6),
    dismissDirection: DismissDirection.startToEnd,
  );
  ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}

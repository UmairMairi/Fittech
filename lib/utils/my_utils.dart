import 'package:another_flushbar/flushbar.dart';
import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
import 'package:fit_tech/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class MyUtils {
  static String printDuration({required Duration duration}) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    // return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static showMessage(
      {required BuildContext context, required String msg, bool? success = false}) {
    if (msg.length > 1) {
      msg = msg.capitalizeFirst();
    }
    Flushbar(
      messageText: Text(
        msg,
        style: MyTextStyle.text1.copyWith(color: MyColors.whiteColor),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.easeIn,
      forwardAnimationCurve: Curves.easeInOut,
      backgroundColor: success! ? MyColors.greenColor : MyColors.redColor,
      isDismissible: true,
      duration: const Duration(seconds: 3),
    ).show(context);


  }
}

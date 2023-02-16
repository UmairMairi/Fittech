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
      {required BuildContext context,
      required String msg,
      bool? success = false}) {
    if (msg.length > 1) {
      msg = msg.capitalizeFirst();
    }
  }
}

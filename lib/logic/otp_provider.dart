import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier {
  OTPProvider();

  String otp = "";

  setPassword({required String val}) {
    otp = val;
    notifyListeners();
  }

}

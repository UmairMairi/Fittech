import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterProvider();

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  bool info1Checked = false;
  bool info2Checked = false;
  bool info3Checked = false;

  setFirstName(String val) {
    firstName = val;
    notifyListeners();
  }
  setLastName(String val) {
    lastName = val;
    notifyListeners();
  }
  setEmail(String val) {
    email = val;
    notifyListeners();
  }

  setPassword(String val) {
    password = val;
    notifyListeners();
  }

  setConfirmPassword(String val) {
    confirmPassword = val;
    notifyListeners();
  }
  setInfo1({required bool val}) {
    info1Checked = val;
    notifyListeners();
  }

  setInfo2({required bool val}) {
    info2Checked = val;
    notifyListeners();
  }

  setInfo3({required bool val}) {
    info3Checked = val;
    notifyListeners();
  }

}

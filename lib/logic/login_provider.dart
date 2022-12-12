import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider();

  String email = "";
  String password = "";

  setEmail(String val) {
    email = val;
    notifyListeners();
  }

  setPassword(String val) {
    password = val;
    notifyListeners();
  }

}

import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider();

  String email = "";
  String password = "";
  LoginModel loginModel = LoginModel();

  Future<void> setLoginModel(
      {required String email, required String password}) async {}

  setEmail(String val) {
    email = val;
    notifyListeners();
  }

  setPassword(String val) {
    password = val;
    notifyListeners();
  }
}

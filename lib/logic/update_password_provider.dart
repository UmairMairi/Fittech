import 'package:flutter/material.dart';

class UpdatePasswordProvider extends ChangeNotifier {
  UpdatePasswordProvider();

  String password = "";
  String confirmPassword = "";

  setPassword({required String val}) {
    password = val;
    notifyListeners();
  }

  setConfirmPassword({required String val}) {
    confirmPassword = val;
    notifyListeners();
  }

}

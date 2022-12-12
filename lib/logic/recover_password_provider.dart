import 'package:flutter/material.dart';

class RecoverPasswordProvider extends ChangeNotifier {
  RecoverPasswordProvider();

  String email = "";

  setEmail({required String val}) {
    email = val;
    notifyListeners();
  }

}

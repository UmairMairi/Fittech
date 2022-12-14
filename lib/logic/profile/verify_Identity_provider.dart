import 'package:flutter/material.dart';

class VerifyIdentityProvider extends ChangeNotifier {
  VerifyIdentityProvider();

  String password = "";

  setPassword({required String val}) {
    password = val;
    notifyListeners();
  }

}

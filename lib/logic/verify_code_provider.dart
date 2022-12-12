import 'package:flutter/material.dart';

class VerifyCodeProvider extends ChangeNotifier {
  VerifyCodeProvider();

  String code = "";

  setCode({required String val}) {
    code = val;
    notifyListeners();
  }

}

import 'dart:io';

import 'package:fit_tech/utils/file_utils.dart';
import 'package:flutter/material.dart';

class ChooseDateProviders extends ChangeNotifier {
  ChooseDateProviders();

  int? date1;
  int? date2;

  List<int> dates = [];

  setDate1({required int? val}) async {
    date1 = val;
    notifyListeners();
  }

  setDate2({required int? val}) async {
    date2 = val;
    notifyListeners();
  }

  // setDate({required int val}) async {
  //   dates.add(val);
  //   notifyListeners();
  // }
  removeDate({required int val}) async {
    dates.remove(val);
    notifyListeners();
  }

}


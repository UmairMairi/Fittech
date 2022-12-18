import 'dart:async';
import 'package:fit_tech/presentation/screens/exercise_screen.dart';
import 'package:flutter/material.dart';

class TrainingCompletedProvider extends ChangeNotifier {

  double? review;
  int selected = -1;

  addRatting({double? val}){
    review = val;
    notifyListeners();
  }

  setSelected({required int val}){
    selected = val;
    notifyListeners();
  }
}

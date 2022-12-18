import 'package:flutter/material.dart';

class GymExerciseProvider extends ChangeNotifier {
  GymExerciseProvider();

  int? currentSet;
  int totalSets = 2;

  setCurrentSet({required int? val}) {
    currentSet = val;
    notifyListeners();
  }
}

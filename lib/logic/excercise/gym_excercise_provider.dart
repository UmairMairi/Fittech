import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/data/models/nutrition_training_model.dart';
import 'package:flutter/material.dart';

class GymExerciseProvider extends ChangeNotifier {
  GymExerciseProvider();

  int? selectedItem;

  setSelectItem({required int val}) {
    selectedItem = val;
    notifyListeners();
  }

}

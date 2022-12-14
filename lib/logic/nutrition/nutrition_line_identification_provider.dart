import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:fit_tech/data/models/nutrition_training_model.dart';
import 'package:flutter/material.dart';

class NutritionLineIdentificationProvider extends ChangeNotifier {
  NutritionLineIdentificationProvider();

  NutritionTrainingModeModel? selectedItem;

  setSelectItem({required NutritionTrainingModeModel val}) {
    selectedItem = val;
    notifyListeners();
  }

}

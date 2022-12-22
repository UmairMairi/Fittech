import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:flutter/material.dart';

class SelectRecipeProvider extends ChangeNotifier {
  SelectRecipeProvider();

  int selectedItem = -1;

  setSelectItem({required int val}) {
    selectedItem = val;
    notifyListeners();
  }

}

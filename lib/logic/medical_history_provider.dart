import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:flutter/material.dart';

class MedicalHistoryProvider extends ChangeNotifier {
  MedicalHistoryProvider();

  ChooseTrainingModeModel? selectedItem;

  setSelectItem({required ChooseTrainingModeModel val}) {
    selectedItem = val;
    notifyListeners();
  }

}

import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:flutter/material.dart';

class WeightHeightProvider extends ChangeNotifier {
  WeightHeightProvider();

  String? weight;
  String? height;

  setWeight({required String val}) {
    weight = val;
    notifyListeners();
  }

  setHeight({required String val}) {
    height = val;
    notifyListeners();
  }

}

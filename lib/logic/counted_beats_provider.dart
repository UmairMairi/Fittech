import 'package:fit_tech/data/models/choose_training_mode_model.dart';
import 'package:flutter/material.dart';

class CountedBeatsProvider extends ChangeNotifier {
  CountedBeatsProvider();

  String? beats;

  setCountedBeats({required String val}) {
    beats = val;
    notifyListeners();
  }

}

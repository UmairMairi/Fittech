import 'dart:io';

import 'package:fit_tech/utils/file_utils.dart';
import 'package:flutter/material.dart';

class AddMeasurementsProviders extends ChangeNotifier {
  AddMeasurementsProviders();

  File? frontImage;
  File? sideImage;
  File? backImage;

  getFrontImage() async {
    var file = await FileUtils.getImageFromCamera();
    frontImage = file;
    notifyListeners();
  }

  getSideImage() async {
    var file = await FileUtils.getImageFromCamera();
    sideImage = file;
    notifyListeners();
  }

  getBackImage() async {
    var file = await FileUtils.getImageFromCamera();
    backImage = file;
    notifyListeners();
  }

}
enum MeasurementsType{
  history,
  testResult,
  addNew,
  addNewFromHistory,
}


import 'dart:io';

import 'package:fit_tech/utils/file_utils.dart';
import 'package:flutter/material.dart';

class AddMeasurementsProviders extends ChangeNotifier {
  AddMeasurementsProviders();

  File? frontImage;
  File? sideImage;
  File? backImage;

  getFrontImage() async {
    var file = await FileUtils.getImageFromGallery();
    frontImage = file;
    notifyListeners();
  }

  getSideImage() async {
    var file = await FileUtils.getImageFromGallery();
    sideImage = file;
    notifyListeners();
  }

  getBackImage() async {
    var file = await FileUtils.getImageFromGallery();
    backImage = file;
    notifyListeners();
  }


}

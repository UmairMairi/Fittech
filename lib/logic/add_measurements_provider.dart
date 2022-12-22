import 'dart:io';

import 'package:fit_tech/presentation/screens/profile/testResults/image_viewer_screen.dart';
import 'package:fit_tech/utils/file_utils.dart';
import 'package:flutter/material.dart';

class AddMeasurementsProviders extends ChangeNotifier {
  AddMeasurementsProviders();

  File? frontImage;
  File? sideImage;
  File? backImage;

  File? imageFile;
  String? title = "";


  getFrontImage({required BuildContext context,SourceType source = SourceType.camera}) async {
    var file = source==SourceType.camera?await FileUtils.getImageFromCamera():await FileUtils.getImageFromGallery();
    imageFile = file;
    title = "Foto frontal";
    notifyListeners();
    if(file!=null){
      Navigator.pushNamed(context, ImageViewerScreen.tag).then((value){
        if(value == true){
          frontImage = file;
          notifyListeners();
        }else{
          frontImage = null;
          notifyListeners();
        }
      });
    }
  }

  getSideImage({required BuildContext context,SourceType source = SourceType.camera}) async {
    var file = source==SourceType.camera?await FileUtils.getImageFromCamera():await FileUtils.getImageFromGallery();
    // sideImage = file;
    // notifyListeners();
    imageFile = file;
    title = "Foto de perfil";
    notifyListeners();
    if(file!=null){
      Navigator.pushNamed(context, ImageViewerScreen.tag).then((value){
        if(value == true){
          sideImage = file;
          notifyListeners();
        }else{
          sideImage = null;
          notifyListeners();
        }
      });
    }
  }

  getBackImage({required BuildContext context,SourceType source = SourceType.camera}) async {
    var file = source==SourceType.camera?await FileUtils.getImageFromCamera():await FileUtils.getImageFromGallery();
    // backImage = file;
    // notifyListeners();
    imageFile = file;
    title = "Foto de espalda";
    notifyListeners();
    if(file!=null){
      Navigator.pushNamed(context, ImageViewerScreen.tag).then((value){
        if(value == true){
          backImage = file;
          notifyListeners();
        }else{
          backImage = null;
          notifyListeners();
        }
      });
    }

  }

}
enum MeasurementsType{
  history,
  testResult,
  addNew,
  addNewFromHistory,
}
enum SourceType{camera,gallery}

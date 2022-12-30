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


  String? weight;
  String? height;
  String? minWaist;
  String? maxWaist;
  String? hip;
  String? neck;
  String? middleThigh;
  String? arm;
  String? chest;



  String? weightTest;
  String? heightTest;
  String? minWaistTest;
  String? maxWaistTest;
  String? hipTest;
  String? neckTest;
  String? middleThighTest;
  String? armTest;
  String? chestTest;

  setWeight({required String val}){
    weightTest = val;
    notifyListeners();
  }
  setHeight({required String val}){
    heightTest = val;
    notifyListeners();
  }
  setMinWaist({required String val}){
    minWaistTest = val;
    notifyListeners();
  }
  setMaxWaist({required String val}){
    maxWaistTest = val;
    notifyListeners();
  }
  setHip({required String val}){
    hipTest = val;
    notifyListeners();
  }
  setNeck({required String val}){
    neckTest = val;
    notifyListeners();
  }
  setMiddleThigh({required String val}){
    middleThighTest = val;
    notifyListeners();
  }
  setArm({required String val}){
    armTest = val;
    notifyListeners();
  }
  setChest({required String val}){
    chestTest = val;
    notifyListeners();
  }

  setData(){
    weight = weightTest;
    height = heightTest;
    minWaist = minWaistTest;
    maxWaist = maxWaistTest;
    hip = hipTest;
    neck = neckTest;
    middleThigh = middleThighTest;
    arm = armTest;
    chest = chestTest;
    notifyListeners();

    weightTest = null;
    heightTest = null;
    minWaistTest = null;
    maxWaistTest = null;
    hipTest = null;
    neckTest = null;
    middleThighTest = null;
    armTest = null;
    chestTest = null;
    notifyListeners();
  }




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

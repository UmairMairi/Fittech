import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fit_tech/presentation/screens/profile/testResults/image_viewer_screen.dart';
import 'package:fit_tech/utils/file_utils.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';

import '../data/network_services/api_services.dart';
import '../utils/api_constants.dart';
import '../utils/global_states.dart';
import '../utils/helper_funtions.dart';

class AddMeasurementsProviders extends ChangeNotifier {
  AddMeasurementsProviders();

  bool isLoading = false;

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

  setWeight({required String val}) {
    weightTest = val;
    notifyListeners();
  }

  setHeight({required String val}) {
    heightTest = val;
    notifyListeners();
  }

  setMinWaist({required String val}) {
    minWaistTest = val;
    notifyListeners();
  }

  setMaxWaist({required String val}) {
    maxWaistTest = val;
    notifyListeners();
  }

  setHip({required String val}) {
    hipTest = val;
    notifyListeners();
  }

  setNeck({required String val}) {
    neckTest = val;
    notifyListeners();
  }

  setMiddleThigh({required String val}) {
    middleThighTest = val;
    notifyListeners();
  }

  setArm({required String val}) {
    armTest = val;
    notifyListeners();
  }

  setChest({required String val}) {
    chestTest = val;
    notifyListeners();
  }

  dataExtractor(data) {
    return data == null ? "" : data.replaceAll(RegExp(r'[^0-9.]'), '');
  }

  setData() {
    weight = dataExtractor(weightTest);
    height = dataExtractor(heightTest);
    minWaist = dataExtractor(minWaistTest);
    maxWaist = dataExtractor(maxWaistTest);
    hip = dataExtractor(hipTest);
    neck = dataExtractor(neckTest);
    middleThigh = dataExtractor(middleThighTest);
    arm = dataExtractor(armTest);
    chest = dataExtractor(chestTest);
    notifyListeners();

    // weightTest = null;
    // heightTest = null;
    // minWaistTest = null;
    // maxWaistTest = null;
    // hipTest = null;
    // neckTest = null;
    // middleThighTest = null;
    // armTest = null;
    // chestTest = null;
    // notifyListeners();
  }

  bool isDataChanged() {
    return (weightTest != null ||
        heightTest != null ||
        minWaistTest != null ||
        maxWaistTest != null ||
        hipTest != null ||
        neckTest != null ||
        middleThighTest != null ||
        armTest != null ||
        chestTest != null);
  }

  getFrontImage(
      {required BuildContext context,
      SourceType source = SourceType.camera,
      ValueChanged<File>? onSelect}) async {
    var file = source == SourceType.camera
        ? await FileUtils.getImageFromCamera()
        : await FileUtils.getImageFromGallery();
    imageFile = file;
    title = "Foto frontal";
    notifyListeners();
    if (imageFile != null) {
      if (onSelect != null) {
        onSelect(imageFile!);
      }
    }
  }

  setFrontImage(File file) {
    frontImage = file;
    notifyListeners();
  }

  getSideImage(
      {required BuildContext context,
      SourceType source = SourceType.camera,
      ValueChanged<File>? onSelect}) async {
    var file = source == SourceType.camera
        ? await FileUtils.getImageFromCamera()
        : await FileUtils.getImageFromGallery();
    imageFile = file;
    title = "Foto de perfil";
    notifyListeners();
    if (imageFile != null) {
      if (onSelect != null) {
        onSelect(imageFile!);
      }
    }
  }

  setSideImage(File file) {
    sideImage = file;
    notifyListeners();
  }

  getBackImage(
      {required BuildContext context,
      SourceType source = SourceType.camera,
      ValueChanged<File>? onSelect}) async {
    var file = source == SourceType.camera
        ? await FileUtils.getImageFromCamera()
        : await FileUtils.getImageFromGallery();
    imageFile = file;
    title = "Foto de espalda";
    notifyListeners();
    if (imageFile != null) {
      if (onSelect != null) {
        onSelect(imageFile!);
      }
    }
  }

  setBackImage(File file) {
    backImage = file;
    notifyListeners();
  }

  resetData() {
    frontImage = null;
    sideImage = null;
    backImage = null;
    imageFile = null;
    title = null;
    weight = null;
    height = null;
    minWaist = null;
    maxWaist = null;
    hip = null;
    neck = null;
    middleThigh = null;
    arm = null;
    chest = null;
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

  /// Api Calling ////

  Future addNutrition({required BuildContext context}) async {
    try {
      var body = {
        "height": "$height",
        "weight": "$weight",
        "food_dont_like": "${GlobalState.nutritionTest!.foodDontLike}",
        "minimum_waist": "$minWaist",
        "maximum_waist": "$maxWaist",
        "hip": "$hip",
        "neck": "$neck",
        "middle_thigh": "$middleThigh",
        "arm": "$arm",
        "chest": "$chest",
        "nutrition_line": "${GlobalState.nutritionTest!.nutritionLine}",
        "fat_percentage": "${GlobalState.nutritionTest!.fatPercentage}",
      };
      print(body);
      var data;
      if (frontImage == null || backImage == null || sideImage == null) {
        showMessage(context: context, msg: "Please! add Images");
      } else {
        data = {
          "front_image": frontImage!.path,
          "back_image": backImage!.path,
          "profile_image": sideImage!.path
        };
      }
      if (data != null) {
        isLoading = true;
        notifyListeners();
        var response = await ApiServices.postMultiPartJson(
            url: ApiConstants.addNutrition,
            body: body,
            filePath: data,
            token: Singleton.userToken);
        print(response.body);
        isLoading = false;
        notifyListeners();
        return jsonDecode(response.body);
      }
    } catch (e) {
      showMessage(
          msg: "check yours internet connection ${e.toString()}",
          context: context);
      isLoading = false;
      notifyListeners();
    }
  }

  validationChecker(context, {isEnable = true}) {
    // bool isValid = false;
    if (frontImage == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter frontImage");
      }
      return false;
    } else if (sideImage == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter sideImage");
      }
      return false;
    } else if (backImage == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter backImage");
      }
      return false;
    } else if (imageFile == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter imageFile");
      }
      return false;
    } else if (weightTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter weight");
      }
      return false;
    } else if (heightTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter height");
      }
      return false;
    } else if (minWaistTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter minWaist");
      }
      return false;
    } else if (maxWaistTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter maxWaist");
      }
      return false;
    } else if (hipTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter hip");
      }
      return false;
    } else if (neckTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter neck");
      }
      return false;
    } else if (middleThighTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter middleThigh");
      }
      return false;
    } else if (armTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter arm");
      }
      return false;
    } else if (chestTest == null) {
      if (isEnable) {
        showMessage(context: context, msg: "Please! Enter chest");
      }
      return false;
    } else {
      // isValid = true;
      return true;
    }

    // return isValid;
  }
}

enum MeasurementsType {
  history,
  testResult,
  addNew,
  addNewFromHistory,
}

enum SourceType { camera, gallery }

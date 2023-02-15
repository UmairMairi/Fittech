import 'dart:io';

import 'package:fit_tech/data/models/profile_models/my_data_screen_model.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/data/repositories/profile_repository/profile_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyDataProvider extends ChangeNotifier {
  MyDataProvider();

  File? imageFile;
  String name = "Angle";
  String lastName = "Castañeda";
  String email = "ejemplo@gmail.com";
  String gender = "Hombre";

  Map<String, dynamic>? updateProfileInMap;
  MyDataScreenModel? myDataScreenModel = MyDataScreenModel();
  bool isLoading = false;

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Map<String, dynamic>? changeProfileImageInMap;

  //get my data screen image here
  Future<void> setMyDataScreenModel({
    required BuildContext context,
  }) async {
    try {
      setBoolValue(true);
      myDataScreenModel = await ProfilePostRepository
          .getRequestChangeProfileImageDecodeJsonString(
              context: context,
              url: ApiConstants.changeProfileImage,
              token: GlobalState.token);
      notifyListeners();
      setBoolValue(false);
    } catch (e) {
      showMessage(
          msg:
              "please check internet connection or something else error exception ${e.toString()}",
          context: context);
      setBoolValue(false);
    }
  }

  //update profile
  Future<void> setChangeProfileImageInMap({
    required BuildContext context,
    Map<String, String>? filePath,
  }) async {
    try {
      setBoolValue(true);
      changeProfileImageInMap =
          await ProfilePostRepository.changeProfileImageDecodeJsonString(
              context: context,
              url: ApiConstants.changeImageProfile,
              filePath: filePath);
      notifyListeners();
      setBoolValue(false);
    } catch (e) {
      showMessage(
          msg:
              "please check internet connection or something else error exception ${e.toString()}",
          context: context);
      setBoolValue(false);
    }
  }

  Future<void> updateProfileData({
    required BuildContext context,
    String? firstName,
    String? lastName,
    String? gender,
    String? updatePassword,
    String? email,
  }) async {
    try {
      setBoolValue(true);
      updateProfileInMap = await OnboardPostRepository.updateProfileDecodeJsonString(
              context: context,
              firstName: firstName,
              lastName: lastName,
              email: email,
              updatePassword: updatePassword,
              gender: gender,
              url: ApiConstants.updateProfile);
      notifyListeners();
      setBoolValue(false);
      if (updateProfileInMap == null) {
        showMessage(msg: "check yours internet connection", context: context);
        setBoolValue(false);
      }
    } catch (e) {
      setBoolValue(false);

      showMessage(msg: "exception ${e.toString()}", context: context);
      setBoolValue(false);
    }
  }

  Future<File?> pickImageFromGallery({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 200,
        maxHeight: 200,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        notifyListeners();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  setName({required String val}) {
    name = val;
    notifyListeners();
  }

  setLastName({required String val}) {
    lastName = val;
    notifyListeners();
  }

  setEmail({required String val}) {
    email = val;
    notifyListeners();
  }

  setGender({required String val}) {
    gender = val;
    notifyListeners();
  }
}

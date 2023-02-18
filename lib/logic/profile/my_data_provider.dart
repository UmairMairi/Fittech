import 'dart:io';

import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/models/UpdateProfileDataModel.dart';
import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';
import 'package:fit_tech/data/models/profile_models/my_data_screen_model.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/data/repositories/profile_repository/profile_repository.dart';
import 'package:fit_tech/logic/login_provider.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyDataProvider extends ChangeNotifier {
  MyDataProvider();

  File? imageFile;
  String name = Singleton.userModel?.data?.userProfile?.user?.firstName ?? "";
  String lastName = Singleton.userModel?.data?.userProfile?.user?.lastName ?? "";
  String email = Singleton.userModel?.data?.userProfile?.user?.email ?? "";
  String gender = "Hombre";
  LoginModel? loginModel;

  MyDataScreenModel? myDataScreenModel;
  UpdateProfileModel? updateProfileInMap;
  UpdateProfileModel? updateProfileModel;
  bool isLoading = false;

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }



  //update profile
  Future<void> updateProfileImage({
    required BuildContext context,
    required Function(UserProfile? model) onSuccess
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      var model = await ProfilePostRepository.uploadImage(
          context: context,
          url: ApiConstants.changeImageProfile,
          filePath: imageFile?.path ?? "");

      isLoading = false;
      notifyListeners();

      if (model is UpdateProfileModel) {
        updateProfileModel = model;
        notifyListeners();
        onSuccess(model.data);
      } else if (model is Map) {
        showMessage(msg: "${model["message"]}", context: context);
      } else {
        showMessage(msg: "something went wrong", context: context);
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      showMessage(msg: "something went wrong", context: context);
    }
  }

  Future<void> updateProfileData({
    required BuildContext context,
    String? firstName,
    String? lastName,
    String? gender,
    String? updatePassword,
    String? email,
    required Function(UserProfile? model) onSuccess
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      var model = await OnboardPostRepository.updateProfileData(
              context: context,
              firstName: firstName,
              lastName: lastName,
              email: email,
              updatePassword: updatePassword,
              gender: gender,
              url: ApiConstants.updateProfile);
      isLoading = false;
      notifyListeners();

      if (model is UpdateProfileModel) {
        updateProfileInMap = model;
        notifyListeners();
        onSuccess(model.data);
      } else if (model is Map) {
        showMessage(msg: "${model["message"]}", context: context);
      } else {
        showMessage(msg: "something went wrong", context: context);
      }

    } catch (e) {
      isLoading = false;
      notifyListeners();
      showMessage(msg: "something went wrong", context: context);
    }
  }

  Future<File?> pickImageFromGallery({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        notifyListeners();
        return imageFile;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
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

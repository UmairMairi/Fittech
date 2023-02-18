import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/data/repositories/profile_repository/profile_repository.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_status_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';

class UpdatePasswordProvider extends ChangeNotifier {
  UpdatePasswordProvider();

  String password = "";
  String confirmPassword = "";
  SuccessResponseGeneric? newPasswordModel;
  SuccessResponseGeneric? updatePasswordModel;

  Future<void> updatePassword(
      {required BuildContext context}) async {
    try {
      isLoading = true;
      notifyListeners();

      var model = await ProfilePostRepository.updatePassword(
          context: context,
          oldPassword: password,
          newPassword: confirmPassword,
          token: Singleton.userToken);
      isLoading = false;
      notifyListeners();

      if (model is SuccessResponseGeneric) {
        updatePasswordModel = model;
        notifyListeners();
        Navigator.pushNamed(context, UpdatePasswordStatusScreen.tag);
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

  bool isLoading = false;

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }

  setPassword({required String val}) {
    password = val;
    notifyListeners();
  }

  setConfirmPassword({required String val}) {
    confirmPassword = val;
    notifyListeners();
  }

  Future<void> setNewPassword(
      {required BuildContext context,
      required String email,
      required String newPassword}) async {
    try {
      isLoading = true;
      notifyListeners();
      var model = await OnboardPostRepository.setNewPassword(
          context: context, email: email, newPassword: newPassword);

      isLoading = false;
      notifyListeners();

      if (model is SuccessResponseGeneric) {
        newPasswordModel = model;
        notifyListeners();
        Navigator.pushNamed(context, UpdatePasswordStatusScreen.tag);
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
}

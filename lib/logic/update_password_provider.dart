import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/data/repositories/profile_repository/profile_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

class UpdatePasswordProvider extends ChangeNotifier {
  UpdatePasswordProvider();

  String password = "";
  String confirmPassword = "";
  Map<String, dynamic>? newPasswordResponseInMap;
  Map<String, dynamic>? updatePasswordAfterLoginResponseInMap;

  Future<void> setUpdatePasswordAfterLoginResponseInMap(
      {required BuildContext context,
      required String currentPassword,
      required String confirmPassword}) async {
    try {
      setBoolValue(true);
      updatePasswordAfterLoginResponseInMap =
          await ProfilePostRepository.updatePasswordAfterLoginDecodeJsonString(
              context: context,
              oldPassword: currentPassword,
              url: ApiConstants.changePasswordAfterLogin,
              newPassword: confirmPassword,
              token: GlobalState.token);
      notifyListeners();
      setBoolValue(false);
    } catch (e) {
      showMessage(
          msg:
              "check yours internet connection or something else error ${e.toString()}",
          context: context);
      setBoolValue(false);
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

  Future<void> setNewPasswordResponseInMap(
      {required BuildContext context,
      required String email,
      required String newPassword}) async {
    try {
      setBoolValue(true);
      newPasswordResponseInMap =
          await OnboardPostRepository.newPasswordDecodeJsonString(
              context: context,
              email: email,
              url: ApiConstants.setNewPassword,
              newPassword: newPassword);
      notifyListeners();
      setBoolValue(false);
      if (newPasswordResponseInMap == null) {
        showMessage(msg: "check internet connection", context: context);
        setBoolValue(false);
      }
    } catch (e) {
      setBoolValue(false);

      showMessage(
          msg:
              "check yours internet connection or something else error ${e.toString()}",
          context: context);
      setBoolValue(false);
    }
  }
}

import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/data/repositories/profile_repository/profile_repository.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_status_screen.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/context_extentions.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:fit_tech/utils/pref_utils.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';

class UpdatePasswordProvider extends ChangeNotifier {
  UpdatePasswordProvider();

  String password = "";
  String confirmPassword = "";
  SuccessResponseGeneric? newPasswordModel;
  SuccessResponseGeneric? updatePasswordModel;

  Future<void> updatePassword({required BuildContext context,String? oldPassword}) async {
    try {
      isLoading = true;
      notifyListeners();

      var model = await ProfilePostRepository.updatePassword(
          context: context,
          oldPassword: oldPassword,
          newPassword: confirmPassword,
          token: Singleton.userToken);
      isLoading = false;
      notifyListeners();

      if (model is SuccessResponseGeneric) {
        updatePasswordModel = model;
        notifyListeners();
        if(!context.mounted)return;
        Navigator.pushNamed(context, UpdatePasswordStatusScreen.tag).then((value){
          if(value == NavigationResults.passwordUpdated){
            Navigator.pop(context,NavigationResults.passwordUpdated);
          }
        });
      } else if (model is Map) {
        MyUtils.showMessage(msg: "${model["message"]}", context: context);
        if(model.containsKey("detail") && model["detail"] == "Invalid token."){
          if(!context.mounted) return;
          PrefUtils.clear();
          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
        }
      } else {
        MyUtils.showMessage(msg: ErrorMessages.somethingWrong, context: context);
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      MyUtils.showMessage(msg: ErrorMessages.somethingWrong, context: context);
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
        if(!context.mounted)return;
        Navigator.pushNamed(context, UpdatePasswordStatusScreen.tag);
      } else if (model is Map) {
        MyUtils.showMessage(msg: "${model["message"]}", context: context);
        if(model.containsKey("detail") && model["detail"] == "Invalid token."){
          if(!context.mounted) return;
          PrefUtils.clear();
          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
        }
      } else {
        MyUtils.showMessage(msg: ErrorMessages.somethingWrong, context: context);
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      MyUtils.showMessage(msg: ErrorMessages.somethingWrong, context: context);
    }
  }
}

import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_screen.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

class VerifyCodeProvider extends ChangeNotifier {
  VerifyCodeProvider();

  String code = "";
  SuccessResponseGeneric? verifyCodeModel;
  bool isLoading = false;

  setCode({required String val}) {
    code = val;
    notifyListeners();
  }

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> verifyCode({
    required BuildContext context,
    required String email,
    required String code,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      var model = await OnboardPostRepository.verifyCode(
          context: context, email: email, code: code);
      if (model is SuccessResponseGeneric) {
        verifyCodeModel = model;
        notifyListeners();
        Navigator.pushNamed(context, UpdatePasswordScreen.tag,arguments: Types.forgotPassword);
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

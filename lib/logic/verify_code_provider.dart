import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_screen.dart';
import 'package:fit_tech/utils/extentions/context_extentions.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:fit_tech/utils/pref_utils.dart';
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
        if(!context.mounted) return;
        Navigator.pushNamed(context, UpdatePasswordScreen.tag,arguments: Types.forgotPassword);
      } else if (model is Map) {
        MyUtils.showMessage(msg: "${model["message"]}", context: context);
        if(model.containsKey("detail") && model["detail"] == "Invalid token."){
          if(!context.mounted) return;
          PrefUtils.clear();
          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
        }
      } else {
        MyUtils.showMessage(msg: "something went wrong", context: context);
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      MyUtils.showMessage(msg: "something went wrong", context: context);
    }
  }
}

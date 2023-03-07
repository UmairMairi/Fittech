import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/verify_code_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/extentions/context_extentions.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:fit_tech/utils/pref_utils.dart';
import 'package:flutter/material.dart';

class RecoverPasswordProvider extends ChangeNotifier {
  RecoverPasswordProvider();

  String email = "";
  SuccessResponseGeneric? recoverPasswordInMap;
  bool isLoading = false;

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> resetPassword({
    required BuildContext context,
    String? email,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      var model =
      await OnboardPostRepository.resetPassword(context: context, email: email ?? this.email, url: ApiConstants.recoverPassword);
      isLoading = false;
      notifyListeners();

      if (model is SuccessResponseGeneric) {
        recoverPasswordInMap = model;
        notifyListeners();
        if(!context.mounted) return;
        if(email==null){
          Navigator.pushNamed(context, VerifyCodeScreen.tag,arguments:this.email);
        }
      }
      else if (model is Map) {
        if(model.containsKey("detail") && model["detail"] == "Invalid token."){
          if(!context.mounted) return;
          PrefUtils.clear();
          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
        }
        MyUtils.showMessage(msg: "${model["message"]}", context: context);
      }else{
        MyUtils.showMessage(msg: "something went wrong", context: context);
      }

    } catch (e) {
      isLoading = false;
      notifyListeners();
      MyUtils.showMessage(msg: "something went wrong", context: context);
    }
  }

  setEmail({required String val}) {
    email = val;
    notifyListeners();
  }
}

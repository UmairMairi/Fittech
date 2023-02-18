import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/onBoarding/verify_code_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
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
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      var model =
      await OnboardPostRepository.resetPassword(context: context, email: email, url: ApiConstants.recoverPassword);
      isLoading = false;
      notifyListeners();

      if (model is SuccessResponseGeneric) {
        recoverPasswordInMap = model;
        notifyListeners();
        Navigator.pushNamed(context, VerifyCodeScreen.tag,arguments:email );
      }
      else if (model is Map) {
        showMessage(msg: "${model["message"]}", context: context);
      }else{
        showMessage(msg: "something went wrong", context: context);

      }

    } catch (e) {
      isLoading = false;
      notifyListeners();
      showMessage(msg: "something went wrong", context: context);
    }
  }

  setEmail({required String val}) {
    email = val;
    notifyListeners();
  }
}

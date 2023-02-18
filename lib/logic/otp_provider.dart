import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/onBoarding/login_welcome_screen.dart';

class OTPProvider extends ChangeNotifier {
  OTPProvider();

  String otp = "";
  SuccessResponseGeneric? verifyEmailModel;
  bool isLoading=false;

  setPassword({required String val}) {
    otp = val;
    notifyListeners();
  }


  Future<void> verifyEmail({
    required BuildContext context,
    required String email,
    required Function onSuccess,
  }) async {
    try {
      isLoading =true;
      notifyListeners();
      var model = await OnboardPostRepository.verifyAccount(
          context: context,
          code: otp,
          email: email,
          url: ApiConstants.verifyAccount);
      isLoading =false;
      notifyListeners();
      if (model is SuccessResponseGeneric) {
        verifyEmailModel = model;
        notifyListeners();
        onSuccess();
      } else if (model is Map) {
        showMessage(msg: "${model["message"]}", context: context);
      } else {
        showMessage(msg: "something went wrong", context: context);
      }
    }
     catch (e) {
       isLoading =false;
       notifyListeners();
       showMessage(msg: "varify api exception ${e.toString()}", context: context);

    }
  }

}

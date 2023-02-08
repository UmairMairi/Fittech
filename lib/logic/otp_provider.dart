import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier {
  OTPProvider();

  String otp = "";
  Map<String, dynamic>? message;




  setPassword({required String val}) {
    otp = val;
    notifyListeners();
  }


  Future<void> setMessage({
    required BuildContext context,
    required String code,
    required String email,
  }) async {
    try {
      message = await OnboardPostRepository.verifyAccount(
          context: context,
          code: code,
          email: email,
          url: ApiConstants.verifyAccount);
      notifyListeners();
      if (message == null) {
        showMessage(msg: "check yours internet connection", context: context);
      }
    } catch (e) {
      showMessage(
          msg: "varify api exception ${e.toString()}", context: context);
    }
  }

}

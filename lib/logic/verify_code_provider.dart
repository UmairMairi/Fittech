import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

class VerifyCodeProvider extends ChangeNotifier {
  VerifyCodeProvider();

  String code = "";
  Map<String, dynamic>? forgotPasswordVerifiedCodeResponseInMap;
  bool isLoading = false;

  setCode({required String val}) {
    code = val;
    notifyListeners();
  }

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> setForgotPasswordVerifiedCodeResponseInMap({
    required BuildContext context,
    required String email,
    required String code,
  }) async {
    try {
      setBoolValue(true);
      forgotPasswordVerifiedCodeResponseInMap = await OnboardPostRepository
          .forgotPasswordVerifiedCodeDecodeJsonString(
              context: context,
              email: email,
              code: code,
              url: ApiConstants.forgotPasswordVerifiedCode);
      notifyListeners();
      setBoolValue(false);
      if (forgotPasswordVerifiedCodeResponseInMap == null) {
        showMessage(
            msg: "response can't be null please check internet connection",
            context: context);
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

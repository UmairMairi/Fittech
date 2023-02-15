import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/onBoarding/login_welcome_screen.dart';

class OTPProvider extends ChangeNotifier {
  OTPProvider();

  String otp = "";
  Map<String, dynamic>? emailVerifyAfterCreateAccountModel;


  bool isLoading=false;
  setBoolValue(bool val){
    isLoading=val;
    notifyListeners();
  }




  setPassword({required String val}) {
    otp = val;
    notifyListeners();
  }


  Future<void> setEmailVerifyAfterCreateAccountModel({
    required BuildContext context,
    required String code,
    required String email,
  }) async {
    try {
      setBoolValue(true);
      emailVerifyAfterCreateAccountModel = await OnboardPostRepository.verifyAccount(
          context: context,
          code: code,
          email: email,
          url: ApiConstants.verifyAccount);
      notifyListeners();
      setBoolValue(false);
      if (emailVerifyAfterCreateAccountModel == null) {
        showMessage(msg: "check yours internet connection", context: context);
        setBoolValue(false);
      }else{
        if (emailVerifyAfterCreateAccountModel?['message'] == "email verified successfully" || emailVerifyAfterCreateAccountModel?["message"] == "Email Already Verified") {
            Navigator.pushNamed(context, LoginWelcomeScreen.tag);
          }
        }
      }
     catch (e) {
      setBoolValue(false);

      showMessage(
          msg: "varify api exception ${e.toString()}", context: context);
      setBoolValue(false);

    }
  }

}

import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider();

  String email = "";
  String password = "";
  LoginModel? loginModel = LoginModel();
  bool isLoading = false;

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> setLoginModel(
      {required BuildContext context,
      required String email,
      required String password}) async {
   try{
     setBoolValue(true);

     loginModel = await OnboardPostRepository.loginJani(
         context: context,
         email: email,
         password: password,
         url: ApiConstants.loginAccount);
     notifyListeners();
     setBoolValue(false);
     if (loginModel?.data == null) {
       showMessage(msg: "Login failed", context: context);
       setBoolValue(false);
     }

   }
   catch (e){
     showMessage(msg: "login api ${e.toString()}", context: context);
     setBoolValue(false);

   }
  }

  setEmail(String val) {
    email = val;
    notifyListeners();
  }

  setPassword(String val) {
    password = val;
    notifyListeners();
  }
}

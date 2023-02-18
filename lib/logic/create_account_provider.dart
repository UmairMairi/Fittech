
import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterProvider();

  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  bool info1Checked = false;
  bool info2Checked = false;
  bool info3Checked = false;


  bool isLoading = false;
  SuccessResponseGeneric? userRegisterModel;
  SuccessResponseGeneric? newPasswordModel;


  setFirstName(String val) {
    firstName = val;
    notifyListeners();
  }
  setLastName(String val) {
    lastName = val;
    notifyListeners();
  }
  setEmail(String val) {
    email = val;
    notifyListeners();
  }

  setPassword(String val) {
    password = val;
    notifyListeners();
  }

  setConfirmPassword(String val) {
    confirmPassword = val;
    notifyListeners();
  }
  setInfo1({required bool val}) {
    info1Checked = val;
    notifyListeners();
  }

  setInfo2({required bool val}) {
    info2Checked = val;
    notifyListeners();
  }

  setInfo3({required bool val}) {
    info3Checked = val;
    notifyListeners();
  }

  Future<void> setUserRegisterModel({required BuildContext context,}) async {
    try {
      isLoading = true;
      notifyListeners();

      var model = await OnboardPostRepository.createAccount(
          context: context,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          url: ApiConstants.createAccount);
      isLoading=false;
      notifyListeners();
      if(model is SuccessResponseGeneric){
        userRegisterModel = model;
        notifyListeners();
        Navigator.pushNamed(context, OTPScreen.tag);
      }else if(model is Map){
        showMessage(msg: "${model["message"]}", context: context);
      }else{
        showMessage(msg: "something went wrong", context: context);
      }
    } catch (e) {
      showMessage(msg: "something went wrong", context: context);
      isLoading = false;
      notifyListeners();
    }
  }


  Future<dynamic> logoutUser({required BuildContext context}) async {
    try {
      isLoading = true;
      notifyListeners();
      var model = await OnboardPostRepository.logout();
      isLoading = false;
      notifyListeners();

      if (model is SuccessResponseGeneric) {
        newPasswordModel = model;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
      } else if (model is Map) {
        showMessage(msg: "${model["message"]}", context: context);
      } else {
        showMessage(msg: "something went wrong", context: context);
      }

    } catch (e) {
      isLoading = false;
      notifyListeners();

      showMessage(msg: "something went wrong", context: context);
      return null;
    }
  }


  void clear(){
    firstName = "";
    lastName = "";
    email = "";
    password = "";
    confirmPassword = "";


    info1Checked = false;
    info2Checked = false;
    info3Checked = false;

    userRegisterModel = null;
  }

}

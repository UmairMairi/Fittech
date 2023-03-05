import 'dart:convert';

import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/context_extentions.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:fit_tech/utils/pref_utils.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider();

  String email = "";
  String password = "";
  LoginModel? loginModel = LoginModel();
  bool isLoading = false;

  Future<void> login(
      {required BuildContext context,
      required String email,
      required String password,
      bool isRegistration = false}) async {
    try {
      isLoading = true;
      notifyListeners();

      var model = await OnboardPostRepository.login(context: context, email: email, password: password);
      isLoading = false;
      notifyListeners();
      if (model is LoginModel) {
        loginModel = model;
        notifyListeners();
        Singleton.userToken = loginModel?.data?.token;
        if (isRegistration == true) {
          if (!context.mounted) return;
          Navigator.pushNamed(context, LoginWelcomeScreen.tag);
        } else {
          if (!context.mounted) return;
          Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.tag, (Route<dynamic> route) => false);
        }
      } else if (model is Map) {
        MyUtils.showMessage(msg: "${model["message"]}", context: context);
      } else {
        MyUtils.showMessage(msg: ErrorMessages.somethingWrong, context: context);
      }
    } catch (e) {
      MyUtils.showMessage(msg: ErrorMessages.somethingWrong, context: context);
      isLoading = false;
      notifyListeners();
    }
  }

  setLoginModel({required UserProfile model}) {
    loginModel?.data?.userProfile = model;
    notifyListeners();
    if (kDebugMode) {
      print("Updates user model--> ${loginModel?.toJson()}");
    }
    PrefUtils.putString(key: PrefUtils.loginModel, value: json.encode(loginModel?.toJson()));
    if (kDebugMode) {
      print("Updates user model Encoded--> ${loginModel?.toJson()}");
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

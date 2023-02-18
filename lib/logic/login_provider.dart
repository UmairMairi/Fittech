import 'package:fit_tech/data/models/on_boarding_model/login_model.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_welcome_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/global_states.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/singlton.dart';
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
        bool isRegistration = false
      }) async {
   try{
     isLoading = true;
     notifyListeners();

     var model = await OnboardPostRepository.login(context: context, email: email, password: password);
     isLoading = false;
     notifyListeners();
     if (model is LoginModel) {
       loginModel = model;
       notifyListeners();
       Singleton.userToken=loginModel?.data?.token;
       if(isRegistration == true){
         Navigator.pushNamed(context, LoginWelcomeScreen.tag);
       }else{
         Navigator.pushNamedAndRemoveUntil(context, DashboardScreen.tag, (Route<dynamic> route) => false );
       }
     } else if (model is Map) {
       showMessage(msg: "${model["message"]}", context: context);
     } else {
       showMessage(msg: "something went wrong", context: context);
     }
   }
   catch (e){
     showMessage(msg: "login api ${e.toString()}", context: context);
     isLoading = false;
     notifyListeners();
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

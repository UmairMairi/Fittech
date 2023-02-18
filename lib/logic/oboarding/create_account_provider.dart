import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/on_boarding_model/LogoutResponse.dart';
import '../../data/models/on_boarding_model/SendCodeResponse.dart';
import '../../data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import '../../utils/my_utils.dart';

class CreateAccountProvider with ChangeNotifier {

  LogoutResponse? logoutResponseModel;
  SendCodeResponse? sendCodeResponseModel;
  var  logoutLoading = false;
  var  sendCodeLoading = false;

  Map<String, dynamic>? userRegisterModel;

  bool isLoading = false;

  Future<void> setUserRegisterModel(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      isLoading = true;
      notifyListeners();

      userRegisterModel = await OnboardPostRepository.createAccount(
          context: context,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          url: ApiConstants.createAccount);
      notifyListeners();

      if (userRegisterModel?["message"] == "User Registered Successfully" ) {
          Navigator.pushNamed(context, OTPScreen.tag);
      }
      isLoading=false;
    } catch (e) {
      showMessage(
          msg: "check yours internet connection ${e.toString()}", context: context);
      isLoading = false;
      notifyListeners();
    }
  }


  Future<dynamic> sendCode({required BuildContext context,required String email}) async {
    sendCodeLoading = true;
    notifyListeners();
    try {
      var response = await OnboardPostRepository.sendCode(email: email);
      if (response is Map) {
        sendCodeLoading = false;
        notifyListeners();
        MyUtils.showMessage(
            context: context, msg: response['message'], success: false);
        return null;
      } else {
        sendCodeResponseModel = response;
        sendCodeLoading = false;
        notifyListeners();
        return sendCodeResponseModel;
      }
    } catch (e) {
      sendCodeLoading = false;
      MyUtils.showMessage(context: context, msg: e.toString(), success: false);
      sendCodeResponseModel = null;
      notifyListeners();
      return null;
    }
  }

}

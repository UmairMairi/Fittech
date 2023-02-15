import 'package:fit_tech/presentation/screens/onBoarding/otp_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repositories/onboarding_reposities/onboarding_post_repository.dart';

class CreateAccountProvider with ChangeNotifier {
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
}

import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repositories/onboarding_reposities/onboarding_post_repository.dart';

class CreateAccountProvider with ChangeNotifier {
  Map<String, dynamic>? message;

  bool isLoading = false;

  Future<void> setMessage(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      isLoading = true;
      notifyListeners();

      message = await OnboardPostRepository.createAccount(
          context: context,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          url: ApiConstants.createAccount);
      notifyListeners();
      if (message == null) {
        showMessage(msg: "check yours internet connection", context: context);
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      showMessage(
          msg: "register api exception ${e.toString()}", context: context);
      isLoading = false;
      notifyListeners();
    }
  }
}

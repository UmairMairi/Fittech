import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

class RecoverPasswordProvider extends ChangeNotifier {
  RecoverPasswordProvider();

  String email = "";
  Map<String, dynamic>? responseInMap;
  bool isLoading = false;

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> setResponseInMap({
    required BuildContext context,
    required String email,
  }) async {
    try {
      setBoolValue(true);
      responseInMap =
          await OnboardPostRepository.recoverPasswordDecodeJsonString(
              context: context,
              email: email,
              url: ApiConstants.recoverPassword);
      notifyListeners();
      setBoolValue(false);
      if (responseInMap == null) {
        showMessage(msg: "response can't be null", context: context);
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

  setEmail({required String val}) {
    email = val;
    notifyListeners();
  }
}

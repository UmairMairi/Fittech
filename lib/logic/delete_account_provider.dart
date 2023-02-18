import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/pref_utils.dart';
import 'package:flutter/widgets.dart';

class DeleteAccountProvider extends ChangeNotifier {
  DeleteAccountProvider();

  SuccessResponseGeneric? deleteAccountModel;
  bool isLoading = false;

  setBoolValue(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> deleteAccount({
    required BuildContext context,
    required String token,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      var model = await OnboardPostRepository.deleteAccount(
        context: context,
        token: token,
      );
      isLoading = false;
      notifyListeners();
      if (model is SuccessResponseGeneric) {
        deleteAccountModel = model;
        notifyListeners();
        PrefUtils.clear();
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
    }
  }
}

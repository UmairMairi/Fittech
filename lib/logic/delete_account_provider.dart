import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/context_extentions.dart';
import 'package:fit_tech/utils/my_utils.dart';
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
        if (!context.mounted) return;
        PrefUtils.clear();
        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
      } else if (model is Map) {
        MyUtils.showMessage(msg: "${model["message"]}", context: context);
        if(model.containsKey("detail") && model["detail"] == "Invalid token."){
          if(!context.mounted) return;
          PrefUtils.clear();
          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.tag, (route) => false);
        }
      } else {
        MyUtils.showMessage(msg: ErrorMessages.somethingWrong, context: context);
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      MyUtils.showMessage(msg: ErrorMessages.somethingWrong, context: context);
    }
  }
}

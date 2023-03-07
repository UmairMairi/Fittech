import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/presentation/screens/onBoarding/login_screen.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/constants.dart';
import 'package:fit_tech/utils/extentions/context_extentions.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/my_utils.dart';
import 'package:fit_tech/utils/pref_utils.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/profile_repository/profile_repository.dart';

class VerifyIdentityProvider extends ChangeNotifier {
  String password = "";

  setPassword({required String val}) {
    password = val;
    notifyListeners();
  }

  bool isLoading = false;
  SuccessResponseGeneric? verifyIdentityInMap;

  setIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> verifyIdentity(
      {required BuildContext context, String? password}) async {
    try {
      isLoading = true;
      notifyListeners();
      var model = await ProfilePostRepository.verifyIdentity(
          context: context,
          url: ApiConstants.verifyIdentity,
          token: Singleton.userToken,
          password: password);

      isLoading = false;
      notifyListeners();

      if (model is SuccessResponseGeneric) {
        verifyIdentityInMap = model;
        notifyListeners();
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, UpdatePasswordScreen.tag, arguments: Types.updatePassword).then((value){
          if(value == NavigationResults.passwordUpdated){
            Navigator.pop(context,NavigationResults.passwordUpdated);
          }
        });
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

import 'package:fit_tech/data/models/SuccessResponseGeeneric.dart';
import 'package:fit_tech/presentation/screens/profile/update_password_screen.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
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
        Navigator.pushNamed(context, UpdatePasswordScreen.tag,
            arguments: Types.updatePassword);
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

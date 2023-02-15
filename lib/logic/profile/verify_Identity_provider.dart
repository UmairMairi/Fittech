import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/profile_repository/profile_repository.dart';
import '../../utils/global_states.dart';

class VerifyIdentityProvider extends ChangeNotifier {
  String password = "";

  setPassword({required String val}) {
    password = val;
    notifyListeners();
  }

  bool isLoading = false;
  Map<String, dynamic>? verifyIdentityInMap;

  setIsLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future<void> setVerifyIdentityInMap({required BuildContext context ,String? password}) async {
    try {
      setIsLoading(true);
      verifyIdentityInMap =
          await ProfilePostRepository.verifyIdentityDecodeJsonString(
              context: context,
              url: ApiConstants.verifyIdentity,
              token: GlobalState.token,password: password);
      notifyListeners();
      setIsLoading(false);
    } catch (e) {
      showMessage(
          msg:
              "please check internet connection or something else error${e.toString()}",
          context: context);
      setIsLoading(false);
    }
  }
}

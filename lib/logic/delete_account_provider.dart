import 'package:fit_tech/data/repositories/onboarding_reposities/onboarding_post_repository.dart';
import 'package:fit_tech/utils/api_constants.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/widgets.dart';

class DeleteAccountProvider extends ChangeNotifier{

  Map<String, dynamic>? deleteAccountResponseInMap;
  bool isLoading=false;
  setBoolValue(bool val){
    isLoading=val;
    notifyListeners();
  }


  Future<void> setDeleteAccountResponseInMap({
    required BuildContext context,
    required String token,
  }) async {
    try {
      setBoolValue(true);
      deleteAccountResponseInMap = await OnboardPostRepository.deleteAccountDecodeJsonString(
          context: context,
          token: token,

          url: ApiConstants.deleteAccount);
      notifyListeners();
      setBoolValue(false);
      if (deleteAccountResponseInMap == null) {
        showMessage(msg: "check yours internet connection", context: context);
        setBoolValue(false);

      }
    } catch (e) {
      setBoolValue(false);

      showMessage(
          msg: "api exception ${e.toString()}", context: context);
      setBoolValue(false);

    }
  }



}
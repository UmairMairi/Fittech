import 'package:fit_tech/data/models/TermsCondtions.dart';
import 'package:fit_tech/data/repositories/policies/policies_repository.dart';
import 'package:flutter/material.dart';

import '../data/models/DataPolicy.dart';
import '../utils/my_utils.dart';

class PoliciesProvider extends ChangeNotifier {
  TermsConditions? termsConditionModel;
  var loading = false;

  DataPolicy? dataPolicyModel;
  var policyLoading = false;

  Future<dynamic> getTermsConditions({required BuildContext context}) async {
    loading = true;
    notifyListeners();
    try {
      var response = await PoliciesRepository.getTermsConditions();
      if (response is Map) {
        loading = false;
        notifyListeners();
        MyUtils.showMessage(
            context: context, msg: response['message'], success: false);
        return null;
      } else {
        termsConditionModel = response;
        loading = false;
        notifyListeners();
        return termsConditionModel;
      }
    } catch (e) {
      loading = false;
      MyUtils.showMessage(context: context, msg: e.toString(), success: false);
      termsConditionModel = null;
      notifyListeners();
      return null;
    }
  }

  Future<dynamic> getPolicyData({required BuildContext context}) async {
    policyLoading = true;
    notifyListeners();
    try {
      var response = await PoliciesRepository.getPolicyData();
      if (response is Map) {
        policyLoading = false;
        notifyListeners();
        MyUtils.showMessage(
            context: context, msg: response['message'], success: false);
        return null;
      } else {
        dataPolicyModel = response;
        policyLoading = false;
        notifyListeners();
        return dataPolicyModel;
      }
    } catch (e) {
      policyLoading = false;
      MyUtils.showMessage(context: context, msg: e.toString(), success: false);
      dataPolicyModel = null;
      notifyListeners();
      return null;
    }
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../../../utils/api_constants.dart';
import '../../models/DataPolicy.dart';
import '../../models/TermsCondtions.dart';
import '../../network_services/api_services.dart';

class PoliciesRepository {
  static Future<dynamic> getTermsConditions() async {
    var response =
        await ApiServices.getJson(url: ApiConstants.getTermsConditions);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      var result = termsConditionsModelFromJson(response.body ?? "");
      return result;
    } else {
      var result = json.decode(response.body ?? "");
      return result;
    }
  }

  static Future<dynamic> getPolicyData() async {
    var response = await ApiServices.getJson(url: ApiConstants.getPolicyData);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      var result = dataPolicyModelFromJson(response.body ?? "");
      return result;
    } else {
      var result = json.decode(response.body ?? "");
      return result;
    }
  }
}

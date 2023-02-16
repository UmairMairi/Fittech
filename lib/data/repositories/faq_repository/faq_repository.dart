import 'dart:convert';

import 'package:fit_tech/data/models/profile_models/FAQ_models/faq_screen_faq_catefgories_model.dart';
import 'package:flutter/foundation.dart';
import '../../../utils/api_constants.dart';
import '../../../utils/singlton.dart';
import '../../models/DataPolicy.dart';
import '../../models/TermsCondtions.dart';
import '../../models/faqData/FaqCategories.dart';
import '../../models/faqData/FaqQuestions.dart';
import '../../network_services/api_services.dart';

class FaqRepository {
  static Future<dynamic> getFaqCategories() async {
    var response =
        await ApiServices.getJson(url: ApiConstants.getFaqCategories,token:  Singleton.userToken);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      var result = faqCategoriesModelFromJson(response.body ?? "");
      return result;
    } else {
      var result = json.decode(response.body ?? "");
      return result;
    }
  }

  static Future<dynamic> getFaqQuestions({required String id}) async {
    var data = {
      "id": "$id",
    };
    var response = await ApiServices.getJson(url: "${ApiConstants.getFaqQuestions}?category_id=$id",token:  Singleton.userToken);
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      var result = faqQuestionsModelFromJson(response.body ?? "");
      return result;
    } else {
      var result = json.decode(response.body ?? "");
      return result;
    }
  }
}

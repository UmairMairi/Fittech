import 'dart:convert';
import 'package:fit_tech/data/models/choose_food_model.dart';
import 'package:fit_tech/data/network_services/api_services.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';

class NutritionRepository {
  static Future<ChooseFoodModel?> getFoods(
      {required BuildContext context, required String url}) async {
    var response = await ApiServices.getJson(url: url);
    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true) {
        var result = ChooseFoodModel.fromJson(jsonDecode(response.body));
        // print(result.toJson());
        return result;
      } else {
        showMessage(
            msg: "${jsonDecode(response.body)["message"]}", context: context);
      }
    } catch (e) {
      showMessage(msg: "Error", context: context);
    }
    return null;
  }

  static Future addNutrition(
      {required BuildContext context, required String url,required body}) async {
    var response = await ApiServices.postJson(url: url,body: body);
    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true) {
            print(response.body);
        // return result;
      } else {
        showMessage(
            msg: "${jsonDecode(response.body)["message"]}", context: context);
      }
    } catch (e) {
      showMessage(msg: "Error", context: context);
    }
    return null;
  }
}

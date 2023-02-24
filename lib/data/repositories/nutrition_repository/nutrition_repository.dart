import 'dart:convert';
import 'package:fit_tech/data/models/choose_food_model.dart';
import 'package:fit_tech/data/network_services/api_services.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:flutter/material.dart';


class NutritionRepository {
 
//  method for change image in response you to get image
  static Future<ChooseFoodModel?>
      getFoods(
          {required BuildContext context,
          required String url}) async {
            
    var response = await ApiServices.getJson(url: url);

    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true) {
        var result = ChooseFoodModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        showMessage(
            msg: "${jsonDecode(response.body)["message"]}",
            context: context);
      }
    } catch (e) {
      showMessage(msg: "Error", context: context);
    }
    return null;
  }
}

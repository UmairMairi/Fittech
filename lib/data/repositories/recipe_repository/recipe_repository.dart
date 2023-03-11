import 'dart:convert';
import 'dart:developer';
import 'package:fit_tech/data/models/recipe/recipe_list_model.dart';
import 'package:fit_tech/data/network_services/api_services.dart';
import 'package:fit_tech/utils/helper_funtions.dart';
import 'package:fit_tech/utils/singlton.dart';
import 'package:flutter/material.dart';

class RecipeRepository {
  static Future<RecipeListModel?> getRecipeList(
      {required BuildContext context, required String url}) async {
    var response = await ApiServices.getJson(url: url,token: Singleton.userToken );
    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true) {            
        var result = RecipeListModel.fromJson(jsonDecode(response.body));
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

  static Future addRecipe(
      {required BuildContext context, required String url,required body}) async {
    var response = await ApiServices.postJson(url: url,body: body,token: Singleton.userToken);
    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true) {
        return jsonDecode(response.body);
      } else {
        showMessage(
            msg: "${jsonDecode(response.body)["message"]}", context: context);
      }
    } catch (e) {
      showMessage(msg: "Error", context: context);
    }
    return null;
  }

  static Future editRecipe(
      {required BuildContext context, required String url,required body}) async {
    var response = await ApiServices.postJson(url: url,body: body,token: Singleton.userToken);
    try {
      if (response.statusCode == 200 &&
          jsonDecode(response.body)["success"] == true) {
        return jsonDecode(response.body);
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

import 'dart:developer';

import 'package:fit_tech/data/models/recipe/recipe_list_model.dart';
import 'package:fit_tech/data/repositories/recipe_repository/recipe_repository.dart';
import 'package:flutter/material.dart';
import '../../utils/api_constants.dart';
import '../../utils/helper_funtions.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeProvider();

  bool isLoading = false;
  RecipeListModel? getRecipeListModel;

  List selectedFood = [];
  var kcal = 0.0;
  var p = 0.0;
  var c = 0.0;
  var g = 0.0;

  addSelectedFood(food) {
    selectedFood.add(food);
    notifyListeners();
  }

  addQuantity(index) {
    selectedFood[index].quantity = ++selectedFood[index].quantity;
    notifyListeners();
  }

  minusQuantity(index) {
    selectedFood[index].quantity = --selectedFood[index].quantity;
    notifyListeners();
  }

  sumCalculator() {
    kcal = 0.0;
    p = 0.0;
    c = 0.0;
    g = 0.0;
    for (var item in selectedFood) {
      kcal += (item.calorie * item.quantity);
      p += (item.protien * item.quantity);
      c += (item.carbs * item.quantity);
      g += (item.fat * item.quantity);
    }
    notifyListeners();
  }

  Future<void> getRecipe({required BuildContext context}) async {
    try {
      isLoading = true;
      notifyListeners();
      getRecipeListModel = await RecipeRepository.getRecipeList(
          context: context, url: ApiConstants.getRecipeList);
      print(getRecipeListModel);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      showMessage(
          msg: "check yours internet connection ${e.toString()}",
          context: context);
      isLoading = false;
      notifyListeners();
    }
    // debugger();
  }

  Future addRecipe({
    required BuildContext context,
    name,
  }) async {
    List foodRecipe = [];
    for (var item in selectedFood) {
      foodRecipe.add({"food": item.id, "quantity": 1});
    }
    try {
      isLoading = true;
      notifyListeners();
      var body = {
        "name": "$name",
        "recipie_type": "Brakefast",
        "food_recipie": foodRecipe
      };
      var response = await RecipeRepository.addRecipe(
          context: context, url: ApiConstants.addRecipe, body: body);
      isLoading = false;
      notifyListeners();
      return response;
    } catch (e) {
      showMessage(
          msg: "check yours internet connection ${e.toString()}",
          context: context);
      isLoading = false;
      notifyListeners();
    }
  }
}

import 'dart:developer';

import 'package:fit_tech/data/repositories/nutrition_repository/nutrition_repository.dart';
import 'package:flutter/material.dart';
import '../../data/models/choose_food_model.dart';
import '../../utils/api_constants.dart';
import '../../utils/helper_funtions.dart';

class ChooseFoodProvider extends ChangeNotifier {
  ChooseFoodProvider();

  bool isLoading = false;
  ChooseFoodModel? getFoodModel;

  Future<void> getFood({required BuildContext context}) async {
    try {
      isLoading = true;
      notifyListeners();  
      getFoodModel = await NutritionRepository.getFoods(
          context: context, url: ApiConstants.getFood);
      notifyListeners();
      isLoading = false;
    } catch (e) {
      showMessage(
          msg: "check yours internet connection ${e.toString()}",
          context: context);
      isLoading = false;
      notifyListeners();
    }
  }
}

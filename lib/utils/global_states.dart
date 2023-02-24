import '../data/models/nutrition_test_model.dart';

class GlobalState {
  static final GlobalState _singleton = GlobalState._internal();

  factory GlobalState() {
    return _singleton;
  }

  GlobalState._internal();

  static String? token;
  static String? email;
  static String? password;

  static NutritionTestModel? nutritionTest;
}

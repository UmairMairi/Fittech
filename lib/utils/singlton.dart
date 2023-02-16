import '../data/models/on_boarding_model/login_model.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  static const bool isDev = false;

  factory Singleton() {
    return _singleton;
  }
  static String? userToken;
  static LoginModel? userModel;
  static String? pressedCategoryId;
  Singleton._internal();
}




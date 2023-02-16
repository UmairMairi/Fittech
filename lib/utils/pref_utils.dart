import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static String loginModel = "login-model";
  static String alertSeen = "alert-seen";

  static putString({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static putBoolean({required String key, required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<String?> getString({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return prefs.getString(key);
    } else {
      return "";
    }
  }

  static Future<bool> getBoolean({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return prefs.getBool(key) ?? false;
    } else {
      return false;
    }
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWork {
  static String emailKey = "emailKey";
  static String emailKeyForRecoverPassword = "emailKeyForRecoverPassword";
  static String tokenKey = "tokenKey";

  static Future<void> saveEmail({required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(emailKey, email);
  }

  static Future<String> getEmailFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey) ?? "";
  }

  static Future<void> saveEmailForRecoverPassword(
      {required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(emailKeyForRecoverPassword, email);
  }
  static Future<void> saveTokenToSharedPreference(
      {required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }
  static Future<String> getTokenFromSharedPreference(
      {required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey)??"";
  }

  static Future<String> getEmailForRecoverPasswordFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKeyForRecoverPassword) ?? "";
  }

  static Future<void> clearSharePreferenceForRecoverPassword() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(emailKeyForRecoverPassword);
  }
}

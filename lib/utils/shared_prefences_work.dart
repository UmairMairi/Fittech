import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWork {
  static String emailKey = "emailKey";

  static Future<void> saveEmail({required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(emailKey, email);
  }

  static Future<String> getEmailFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey) ?? "";
  }
}

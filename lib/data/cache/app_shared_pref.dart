import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const String KEY_AUTH_KEY = "authKey";
  static const String KEY_IS_LOGIN = "login";
  static const String KEY_IS_FIRST_TIME = "firstTime";
  static const String KEY_STAFF_NAME = "Name";
  static const String KEY_STAFF_EMAIL = "Email";
  static const String KEY_STAFF_PHONE = "Phone";
  static const String KEY_STAFF_TOKEN = "Token";
  static const String KEY_STAFF_AVATAR = "Avatar";
  static const String KEY_STAFF_ID = "Id";
  static const String KEY_SEEN = "seen";
  static const String LANG = "lang";

  static setString(String key, String value) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(key) == null ? "" : sp.getString(key);
  }

  static setBool(String key, bool value) async {
    final sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(key) == null ? false : sp.getBool(key);
  }

  static logOutUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

}

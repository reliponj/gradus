import 'package:shared_preferences/shared_preferences.dart';

class UserSharedStorage {
  static late SharedPreferences prefs;

  static getPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setBool(name, value) async {
    await prefs.setBool(name, value);
  }

  static bool getBool(name) {
    final bool? token = prefs.getBool(name);
    return token ?? false;
  }

  static clear() async {
    await prefs.clear();
  }
}
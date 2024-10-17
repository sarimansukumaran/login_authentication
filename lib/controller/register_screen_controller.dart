import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreenController {
  static late final SharedPreferences prefs;
  static initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future addEmail(String email) async {
    await prefs.setString("email", email);
  }

  static getEmail() {
    return prefs.getString("email");
  }

  static Future addPassword(String password) async {
    await prefs.setString("pass", password);
  }

  static getPassword() {
    return prefs.getString("pass");
  }

  static Future isLogged(bool login) async {
    await prefs.setBool("login", login);
  }

  static getisLogged() {
    return prefs.getBool("login") ?? false;
  }
}

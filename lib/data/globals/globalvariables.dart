import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/pref_utils.dart';

class GlobalVariables {
  static bool isLoggedIn = false;
  static String userID = "";
static String currentLanguage = "1";

   static init() {
     SharedPreferences.getInstance().then((value) {
    isLoggedIn = value.getBool("isLoggedIn") ?? false;
    userID = value.getString("userID") ?? "";
     });
  }
  static setLogin(bool value) {
    PrefUtils.sharedPreferences?.setBool("isLoggedIn", value);
    isLoggedIn = value;
  }
   static setUserID(String value) {
    PrefUtils.sharedPreferences?.setString("userID", value);
    userID= value;
  }
}

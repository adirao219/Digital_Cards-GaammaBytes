import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/pref_utils.dart';

class GlobalVariables {
  static bool isLoggedIn = false;
  static bool isGoogleLoggedIn = false;
  static String userID = "";
  static String displayName = "";
  static String userName = "";
  static String userPhotoUrl = "";
  static String currentLanguage = "1";
  static BuildContext? appContext;

  static String tempCaptionContent = "";
  static String tempMessageContent = "";
  static String tempSenderContent = "";

  static init() {
    SharedPreferences.getInstance().then((value) {
      isLoggedIn = value.getBool("isLoggedIn") ?? false;
      userID = value.getString("userID") ?? "";
      displayName = value.getString("displayName") ?? "";
      userName = value.getString("userName") ?? "";
      userPhotoUrl = value.getString("userPhotoUrl") ?? "";
      isGoogleLoggedIn = value.getBool("isGoogleLoggedIn") ?? false;
    });
  }

  static setLogin(bool value) {
    PrefUtils.sharedPreferences?.setBool("isLoggedIn", value);
    isLoggedIn = value;
  }

  static setBuildContext(BuildContext context) {
    appContext = context;
  }

  static setGoogleLoggedIn(bool value) {
    PrefUtils.sharedPreferences?.setBool("isGoogleLoggedIn", value);
    isGoogleLoggedIn = value;
  }

  static setCurrentLocale(String value) {
    PrefUtils.sharedPreferences?.setString("currentLocale", value);
  }
static setCurrentLanguageID(String value) {
  currentLanguage = value;
    PrefUtils.sharedPreferences?.setString("currentLanguageID", value);
  }

  static setCurrentLocaleTranslations(String jsonValue) {
    PrefUtils.sharedPreferences
        ?.setString("currentLocaleTranslations", jsonValue);
  }

  static setUserID(String value) {
    PrefUtils.sharedPreferences?.setString("userID", value);
    userID = value;
  }

  static setDisplayname(String value) {
    PrefUtils.sharedPreferences?.setString("displayName", value);
    displayName = value;
  }

  static setUserName(String value) {
    PrefUtils.sharedPreferences?.setString("userName", value);
    userName = value;
  }

  static setUserPhotoUrl(String value) {
    PrefUtils.sharedPreferences?.setString("userPhotoUrl", value);
    userPhotoUrl = value;
  }
}

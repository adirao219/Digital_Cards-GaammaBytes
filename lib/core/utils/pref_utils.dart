//ignore: unused_import
import 'dart:convert';
import 'package:digitalcards_gaammabytes/data/globals/globalvariables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      
    });
  }
  
  Future<void> init() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    sharedPreferences!.clear();
  }
}

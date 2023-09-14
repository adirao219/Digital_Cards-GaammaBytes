import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = true;

  static String lottiePath = 'assets/lottieFiles/custom_loader.json';

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) {
    try {
      if (!isProgressVisible) {
        Get.dialog(
          Center(
            child: Lottie.asset(
              lottiePath,
              height: 250,
              width: 250,
            ),
          ),
        );
      }
      isProgressVisible = true;
      
    } catch (ex) {}
  }

  static void showSmallProgressDialog(BuildContext mainContext) {
    try {
      if (!isProgressVisible) {
        Get.dialog(
          Center(
            child: Lottie.asset(
              lottiePath,
              height: 250,
              width: 250,
            ),
          ),
        );
      }
      isProgressVisible = true;
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (isProgressVisible) Navigator.of(mainContext).pop();
        isProgressVisible = false;
      });
    } catch (ex) {}
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = true;

  static String lottiePath = 'assets/lottieFiles/custom_loader.json';

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) {
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
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }
}

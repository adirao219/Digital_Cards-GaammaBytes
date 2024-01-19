import 'package:digitalcardsgaammabytes/data/globals/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = true;

  static String lottiePath = 'assets/lottieFiles/custom_loader.json';

  ///common method for showing progress dialog
  static void showProgressDialog(BuildContext appcontext,{isCancellable = false}) {
    appcontext.loaderOverlay.show();
    // try {
    //   if (!isProgressVisible) {
    //     Get.dialog(
    //       Center(
    //         child: Lottie.asset(
    //           lottiePath,
    //           height: 250,
    //           width: 250,
    //         ),
    //       ),
    //     );
    //   }
    //   isProgressVisible = true;

    // } catch (ex) {}
  }
  
  ///common method for showing progress dialog
  static void showLoader(BuildContext appcontext) {
    appcontext.loaderOverlay.show();
    
  }
   static void hideLoader(BuildContext appcontext) {
    appcontext.loaderOverlay.hide();
    
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
  static void hideProgressDialog(BuildContext mainContext) {
    // if (isProgressVisible) Get.back();
    // isProgressVisible = false;
    try {
      var isVisible = mainContext.loaderOverlay.visible;
      if (isVisible) {
        mainContext.loaderOverlay.hide();
      }
    } catch (e) {
      var s = 1;
    }
  }
}

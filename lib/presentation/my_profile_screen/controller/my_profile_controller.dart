import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:flutter/material.dart';

class MyProfileController extends GetxController {
  TextEditingController languageController = TextEditingController();

  TextEditingController group33633Controller = TextEditingController();

  TextEditingController group33635Controller = TextEditingController();

  TextEditingController languageOneController = TextEditingController();

  TextEditingController group33638Controller = TextEditingController();

  TextEditingController languageTwoController = TextEditingController();

  TextEditingController languageThreeController = TextEditingController();

  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    languageController.dispose();
    group33633Controller.dispose();
    group33635Controller.dispose();
    languageOneController.dispose();
    group33638Controller.dispose();
    languageTwoController.dispose();
    languageThreeController.dispose();
  }
}

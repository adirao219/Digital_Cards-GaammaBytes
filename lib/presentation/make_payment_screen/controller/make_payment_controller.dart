import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/presentation/make_payment_screen/models/make_payment_model.dart';
import 'package:flutter/material.dart';

class MakePaymentController extends GetxController {
  TextEditingController languageController = TextEditingController();

  TextEditingController group33633Controller = TextEditingController();

  TextEditingController group33635Controller = TextEditingController();

  TextEditingController languageOneController = TextEditingController();

  TextEditingController group33638Controller = TextEditingController();

  TextEditingController languageTwoController = TextEditingController();

  Rx<MakePaymentModel> makePaymentModelObj = MakePaymentModel().obs;

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
  }
}

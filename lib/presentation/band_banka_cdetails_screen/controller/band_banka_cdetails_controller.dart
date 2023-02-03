import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/band_banka_cdetails_screen/models/band_banka_cdetails_model.dart';import 'package:flutter/material.dart';class BandBankaCdetailsController extends GetxController {TextEditingController group33636Controller = TextEditingController();

TextEditingController group33633Controller = TextEditingController();

TextEditingController group33635Controller = TextEditingController();

TextEditingController group33637Controller = TextEditingController();

TextEditingController group33639Controller = TextEditingController();

TextEditingController group33640Controller = TextEditingController();

TextEditingController priceController = TextEditingController();

TextEditingController group33642Controller = TextEditingController();

Rx<BandBankaCdetailsModel> bandBankaCdetailsModelObj = BandBankaCdetailsModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33636Controller.dispose(); group33633Controller.dispose(); group33635Controller.dispose(); group33637Controller.dispose(); group33639Controller.dispose(); group33640Controller.dispose(); priceController.dispose(); group33642Controller.dispose(); } 
 }

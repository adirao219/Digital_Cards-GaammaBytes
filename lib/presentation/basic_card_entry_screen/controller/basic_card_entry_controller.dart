import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/basic_card_entry_screen/models/basic_card_entry_model.dart';import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';import 'package:flutter/material.dart';class BasicCardEntryController extends GetxController {TextEditingController group33636Controller = TextEditingController();

TextEditingController group33633Controller = TextEditingController();

TextEditingController group33637Controller = TextEditingController();

TextEditingController group33636OneController = TextEditingController();

TextEditingController group33633OneController = TextEditingController();

TextEditingController group33635Controller = TextEditingController();

TextEditingController group33637OneController = TextEditingController();

Rx<BasicCardEntryModel> basicCardEntryModelObj = BasicCardEntryModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33636Controller.dispose(); group33633Controller.dispose(); group33637Controller.dispose(); group33636OneController.dispose(); group33633OneController.dispose(); group33635Controller.dispose(); group33637OneController.dispose(); } 
 }

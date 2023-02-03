import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/card_entryone_screen/models/card_entryone_model.dart';import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';import 'package:flutter/material.dart';class CardEntryoneController extends GetxController {TextEditingController group33636Controller = TextEditingController();

TextEditingController group33633Controller = TextEditingController();

TextEditingController group33635Controller = TextEditingController();

TextEditingController group33637Controller = TextEditingController();

TextEditingController group33636OneController = TextEditingController();

TextEditingController group33633OneController = TextEditingController();

TextEditingController group33635OneController = TextEditingController();

TextEditingController group33637OneController = TextEditingController();

TextEditingController group33636TwoController = TextEditingController();

TextEditingController group33633TwoController = TextEditingController();

TextEditingController group33635TwoController = TextEditingController();

TextEditingController group33637TwoController = TextEditingController();

TextEditingController group33636ThreeController = TextEditingController();

TextEditingController group33633ThreeController = TextEditingController();

TextEditingController group33637ThreeController = TextEditingController();

Rx<CardEntryoneModel> cardEntryoneModelObj = CardEntryoneModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33636Controller.dispose(); group33633Controller.dispose(); group33635Controller.dispose(); group33637Controller.dispose(); group33636OneController.dispose(); group33633OneController.dispose(); group33635OneController.dispose(); group33637OneController.dispose(); group33636TwoController.dispose(); group33633TwoController.dispose(); group33635TwoController.dispose(); group33637TwoController.dispose(); group33636ThreeController.dispose(); group33633ThreeController.dispose(); group33637ThreeController.dispose(); } 
 }

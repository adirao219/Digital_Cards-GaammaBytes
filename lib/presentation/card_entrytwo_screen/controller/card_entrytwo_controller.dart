import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/card_entrytwo_screen/models/card_entrytwo_model.dart';import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';import 'package:flutter/material.dart';class CardEntrytwoController extends GetxController {TextEditingController group33635Controller = TextEditingController();

TextEditingController group33633Controller = TextEditingController();

TextEditingController group253Controller = TextEditingController();

Rx<CardEntrytwoModel> cardEntrytwoModelObj = CardEntrytwoModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33635Controller.dispose(); group33633Controller.dispose(); group253Controller.dispose(); } 
 }

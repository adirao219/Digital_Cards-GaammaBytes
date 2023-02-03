import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/basic_greeting_entry_screen/models/basic_greeting_entry_model.dart';import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';import 'package:flutter/material.dart';class BasicGreetingEntryController extends GetxController {TextEditingController group33637Controller = TextEditingController();

TextEditingController group33636Controller = TextEditingController();

TextEditingController group33636OneController = TextEditingController();

TextEditingController group250Controller = TextEditingController();

Rx<BasicGreetingEntryModel> basicGreetingEntryModelObj = BasicGreetingEntryModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33637Controller.dispose(); group33636Controller.dispose(); group33636OneController.dispose(); group250Controller.dispose(); } 
 }

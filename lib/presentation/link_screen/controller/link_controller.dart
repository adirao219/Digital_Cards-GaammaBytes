import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/link_screen/models/link_model.dart';import 'package:flutter/material.dart';class LinkController extends GetxController {TextEditingController group33636Controller = TextEditingController();

TextEditingController group33635Controller = TextEditingController();

TextEditingController group33637Controller = TextEditingController();

TextEditingController group33642Controller = TextEditingController();

TextEditingController group33644Controller = TextEditingController();

Rx<LinkModel> linkModelObj = LinkModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33636Controller.dispose(); group33635Controller.dispose(); group33637Controller.dispose(); group33642Controller.dispose(); group33644Controller.dispose(); } 
 }

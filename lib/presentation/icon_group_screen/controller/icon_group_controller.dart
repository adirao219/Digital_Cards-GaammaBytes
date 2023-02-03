import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/icon_group_screen/models/icon_group_model.dart';import 'package:flutter/material.dart';class IconGroupController extends GetxController {TextEditingController group33636Controller = TextEditingController();

TextEditingController linkCounterSixController = TextEditingController();

TextEditingController linkCounterSevenController = TextEditingController();

Rx<IconGroupModel> iconGroupModelObj = IconGroupModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33636Controller.dispose(); linkCounterSixController.dispose(); linkCounterSevenController.dispose(); } 
 }

import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/band_map_screen/models/band_map_model.dart';import 'package:flutter/material.dart';class BandMapController extends GetxController {TextEditingController group33633Controller = TextEditingController();

TextEditingController group33633OneController = TextEditingController();

TextEditingController group33635Controller = TextEditingController();

Rx<BandMapModel> bandMapModelObj = BandMapModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33633Controller.dispose(); group33633OneController.dispose(); group33635Controller.dispose(); } 
 }

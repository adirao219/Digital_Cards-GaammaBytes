import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/band_link_screen/models/band_link_model.dart';import 'package:flutter/material.dart';class BandLinkController extends GetxController {TextEditingController group33633Controller = TextEditingController();

TextEditingController group33635Controller = TextEditingController();

Rx<BandLinkModel> bandLinkModelObj = BandLinkModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); group33633Controller.dispose(); group33635Controller.dispose(); } 
 }

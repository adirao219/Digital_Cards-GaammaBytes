import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/customization_screen/models/customization_model.dart';import 'package:digitalcards_gaammabytes/widgets/custom_bottom_bar.dart';class CustomizationController extends GetxController {Rx<CustomizationModel> customizationModelObj = CustomizationModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }

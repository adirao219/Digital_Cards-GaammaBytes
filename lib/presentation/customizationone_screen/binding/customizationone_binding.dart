import '../controller/customizationone_controller.dart';
import 'package:get/get.dart';

class CustomizationoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomizationoneController());
  }
}

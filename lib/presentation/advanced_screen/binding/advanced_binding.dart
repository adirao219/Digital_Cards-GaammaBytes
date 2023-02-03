import '../controller/advanced_controller.dart';
import 'package:get/get.dart';

class AdvancedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdvancedController());
  }
}

import '../controller/digital_card_options_controller.dart';
import 'package:get/get.dart';

class DigitalCardOptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DigitalCardOptionsController());
  }
}

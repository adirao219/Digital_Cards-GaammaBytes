import '../controller/e_greeting_card_options_controller.dart';
import 'package:get/get.dart';

class EGreetingCardOptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EGreetingCardOptionsController());
  }
}

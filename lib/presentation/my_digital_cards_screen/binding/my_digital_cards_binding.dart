import '../controller/my_digital_cards_controller.dart';
import 'package:get/get.dart';

class MyDigitalCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyDigitalCardsController());
  }
}

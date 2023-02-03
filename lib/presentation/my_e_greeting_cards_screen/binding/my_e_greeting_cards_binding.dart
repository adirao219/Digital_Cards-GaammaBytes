import '../controller/my_e_greeting_cards_controller.dart';
import 'package:get/get.dart';

class MyEGreetingCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyEGreetingCardsController());
  }
}

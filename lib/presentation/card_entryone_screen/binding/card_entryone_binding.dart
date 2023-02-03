import '../controller/card_entryone_controller.dart';
import 'package:get/get.dart';

class CardEntryoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardEntryoneController());
  }
}

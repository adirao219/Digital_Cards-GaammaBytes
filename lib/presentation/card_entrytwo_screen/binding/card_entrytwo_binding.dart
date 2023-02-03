import '../controller/card_entrytwo_controller.dart';
import 'package:get/get.dart';

class CardEntrytwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardEntrytwoController());
  }
}

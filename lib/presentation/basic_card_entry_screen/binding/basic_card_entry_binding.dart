import '../controller/basic_card_entry_controller.dart';
import 'package:get/get.dart';

class BasicCardEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicCardEntryController());
  }
}

import '../controller/basic_greeting_entry_controller.dart';
import 'package:get/get.dart';

class BasicGreetingEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicGreetingEntryController());
  }
}

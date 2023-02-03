import '../controller/basic_card_entry_one_controller.dart';
import 'package:get/get.dart';

class BasicCardEntryOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicCardEntryOneController());
  }
}

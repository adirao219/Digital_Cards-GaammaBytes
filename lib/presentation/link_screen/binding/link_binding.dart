import '../controller/link_controller.dart';
import 'package:get/get.dart';

class LinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LinkController());
  }
}

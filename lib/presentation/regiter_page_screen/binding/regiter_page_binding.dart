import '../controller/regiter_page_controller.dart';
import 'package:get/get.dart';

class RegiterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegiterPageController());
  }
}

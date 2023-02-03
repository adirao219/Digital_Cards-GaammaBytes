import '../controller/verifiaction_page_controller.dart';
import 'package:get/get.dart';

class VerifiactionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifiactionPageController());
  }
}

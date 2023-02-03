import '../controller/footer_controller.dart';
import 'package:get/get.dart';

class FooterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FooterController());
  }
}

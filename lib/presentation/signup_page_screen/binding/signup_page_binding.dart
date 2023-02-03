import '../controller/signup_page_controller.dart';
import 'package:get/get.dart';

class SignupPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupPageController());
  }
}

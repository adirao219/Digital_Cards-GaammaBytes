import '../controller/forgot_passwordtwo_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordtwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordtwoController());
  }
}

import '../controller/forgot_passwordone_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordoneController());
  }
}

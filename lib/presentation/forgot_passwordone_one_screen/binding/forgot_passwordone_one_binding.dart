import '../controller/forgot_passwordone_one_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordoneOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordoneOneController());
  }
}

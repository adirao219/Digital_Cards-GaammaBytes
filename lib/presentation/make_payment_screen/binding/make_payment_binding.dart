import '../controller/make_payment_controller.dart';
import 'package:get/get.dart';

class MakePaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MakePaymentController());
  }
}

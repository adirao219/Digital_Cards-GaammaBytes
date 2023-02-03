import '../controller/select_templatetwo_controller.dart';
import 'package:get/get.dart';

class SelectTemplatetwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectTemplatetwoController());
  }
}

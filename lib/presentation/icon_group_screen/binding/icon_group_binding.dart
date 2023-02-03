import '../controller/icon_group_controller.dart';
import 'package:get/get.dart';

class IconGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IconGroupController());
  }
}

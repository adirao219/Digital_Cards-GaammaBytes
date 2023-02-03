import '../controller/bands_controller.dart';
import 'package:get/get.dart';

class BandsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandsController());
  }
}

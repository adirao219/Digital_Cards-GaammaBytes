import '../controller/band_icongroup_controller.dart';
import 'package:get/get.dart';

class BandIcongroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandIcongroupController());
  }
}

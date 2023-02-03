import '../controller/band_link_controller.dart';
import 'package:get/get.dart';

class BandLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandLinkController());
  }
}

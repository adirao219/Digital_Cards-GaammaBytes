import '../controller/band_contactband_controller.dart';
import 'package:get/get.dart';

class BandContactbandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandContactbandController());
  }
}

import '../controller/band_upicard_controller.dart';
import 'package:get/get.dart';

class BandUpicardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandUpicardController());
  }
}

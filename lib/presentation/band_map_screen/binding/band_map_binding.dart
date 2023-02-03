import '../controller/band_map_controller.dart';
import 'package:get/get.dart';

class BandMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandMapController());
  }
}

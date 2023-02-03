import '../controller/band_picture_controller.dart';
import 'package:get/get.dart';

class BandPictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandPictureController());
  }
}

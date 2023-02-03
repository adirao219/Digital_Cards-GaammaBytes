import '../controller/band_video_controller.dart';
import 'package:get/get.dart';

class BandVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandVideoController());
  }
}

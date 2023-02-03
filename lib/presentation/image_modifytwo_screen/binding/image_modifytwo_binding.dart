import '../controller/image_modifytwo_controller.dart';
import 'package:get/get.dart';

class ImageModifytwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageModifytwoController());
  }
}

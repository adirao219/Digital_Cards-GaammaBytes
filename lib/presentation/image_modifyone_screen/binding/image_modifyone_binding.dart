import '../controller/image_modifyone_controller.dart';
import 'package:get/get.dart';

class ImageModifyoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageModifyoneController());
  }
}

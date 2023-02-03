import '../controller/image_modifythree_controller.dart';
import 'package:get/get.dart';

class ImageModifythreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageModifythreeController());
  }
}

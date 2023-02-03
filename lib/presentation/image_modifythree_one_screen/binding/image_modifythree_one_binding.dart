import '../controller/image_modifythree_one_controller.dart';
import 'package:get/get.dart';

class ImageModifythreeOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageModifythreeOneController());
  }
}

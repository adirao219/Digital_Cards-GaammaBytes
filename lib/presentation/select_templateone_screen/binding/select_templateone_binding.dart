import '../controller/select_templateone_controller.dart';
import 'package:get/get.dart';

class SelectTemplateoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectTemplateoneController());
  }
}

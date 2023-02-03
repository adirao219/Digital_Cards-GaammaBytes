import '../controller/card_previewone_controller.dart';
import 'package:get/get.dart';

class CardPreviewoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardPreviewoneController());
  }
}

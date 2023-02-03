import '../controller/card_previewone_one_controller.dart';
import 'package:get/get.dart';

class CardPreviewoneOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardPreviewoneOneController());
  }
}

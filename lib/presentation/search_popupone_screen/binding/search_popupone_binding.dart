import '../controller/search_popupone_controller.dart';
import 'package:get/get.dart';

class SearchPopuponeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPopuponeController());
  }
}

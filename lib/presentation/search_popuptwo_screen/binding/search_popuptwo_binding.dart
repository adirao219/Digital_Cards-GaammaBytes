import '../controller/search_popuptwo_controller.dart';
import 'package:get/get.dart';

class SearchPopuptwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPopuptwoController());
  }
}

import '../controller/bands_one_controller.dart';
import 'package:get/get.dart';

class BandsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandsOneController());
  }
}

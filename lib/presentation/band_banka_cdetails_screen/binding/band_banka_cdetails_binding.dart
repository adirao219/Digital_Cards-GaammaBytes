import '../controller/band_banka_cdetails_controller.dart';
import 'package:get/get.dart';

class BandBankaCdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandBankaCdetailsController());
  }
}

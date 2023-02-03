import '../controller/band_note_controller.dart';
import 'package:get/get.dart';

class BandNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BandNoteController());
  }
}

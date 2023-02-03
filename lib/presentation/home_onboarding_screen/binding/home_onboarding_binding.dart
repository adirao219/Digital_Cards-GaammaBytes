import '../controller/home_onboarding_controller.dart';
import 'package:get/get.dart';

class HomeOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeOnboardingController());
  }
}

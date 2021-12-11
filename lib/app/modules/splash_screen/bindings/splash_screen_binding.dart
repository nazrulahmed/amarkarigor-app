import 'package:amar_karigor/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(
      SplashScreenController(),
    );
    
  }
}

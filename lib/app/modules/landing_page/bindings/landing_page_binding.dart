import 'package:amarkarigor/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/landing_page_controller.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(
      () => LandingPageController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

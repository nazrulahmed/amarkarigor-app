import 'package:amar_karigor/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(
       CategoryController()
    );
    Get.put<HomeController>(HomeController());
  }
}

import 'package:amar_karigor/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<SearchController>(SearchController());
    
  }
}

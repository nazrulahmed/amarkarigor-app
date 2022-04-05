import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:amar_karigor/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  late HomeController homeController;
  List<Service> services = [];
  @override
  void onInit() {
    super.onInit();

    homeController = Get.find();
    services.addAll(homeController.services);
  }

  void performSearch(String query) {
    services.clear();
    for (Service service in homeController.services) {
      if (service.name.contains(query)) {
        services.add(service);
      }
    }

    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

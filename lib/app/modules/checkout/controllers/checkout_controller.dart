import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  Map<String, dynamic>? serviceMap;
  @override
  void onInit() {
    super.onInit();
    print('checkout init');
    serviceMap = Get.arguments;
    print(serviceMap);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void updateProfile() {
    Get.toNamed(Routes.UPDATE_PROFILE,arguments: serviceMap);
  }
}

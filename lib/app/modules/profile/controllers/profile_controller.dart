import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Map<String, dynamic>? serviceMap;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    print('profile init');
    serviceMap = Get.arguments;
    print(serviceMap);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String generateErrorMsg(String msg) {
    return "          $msg\n";
  }

  void updateInfo() {}
}

import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var currentIndex = 0.obs;

  changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

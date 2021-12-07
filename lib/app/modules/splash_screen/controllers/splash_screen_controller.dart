import 'package:amar_karigor/app/global/util/app_pref.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  AppPref pref = AppPref.instance;
  @override
  void onInit() {
    
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
    String? token = pref.retriveToken();
    String? phone = pref.retrivePhoneNumber();
    if (token == null || phone==null) {
      Get.offAndToNamed(Routes.AUTH);
    }else{
      Get.offAndToNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
}

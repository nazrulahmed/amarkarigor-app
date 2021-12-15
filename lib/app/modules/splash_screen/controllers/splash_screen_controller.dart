import 'package:amar_karigor/app/global/util/app_pref.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  Future<AppPref?> myPref = AppPref.instance;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async{
    super.onReady();
   
    AppPref? pref = await myPref;
    String? token = pref!.retriveToken();
    String? phone = pref.retrivePhoneNumber();
    if (token == null || phone == null) {
      Get.offAndToNamed(Routes.AUTH);
    } else {
      Get.offAndToNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
}

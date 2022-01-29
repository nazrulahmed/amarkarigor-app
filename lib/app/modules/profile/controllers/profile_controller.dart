import 'package:get/get.dart';

class ProfileController extends GetxController {

  var isLoading = false.obs;
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

  String generateErrorMsg(String msg) {
    return "          $msg\n";
  }

  void updateInfo() {}
}

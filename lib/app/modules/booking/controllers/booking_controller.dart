import 'package:get/get.dart';

class BookingController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('oninit called from bookingCOntorller');
  }

  @override
  void onReady() {
    super.onReady();
     print('oninit called from bookingCOntorller');
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

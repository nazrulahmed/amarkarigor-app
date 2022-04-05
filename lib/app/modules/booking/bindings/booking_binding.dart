import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookingController>(
      BookingController(),
    );
    Get.put<CheckoutController>(
      CheckoutController(),
    );
  }
}

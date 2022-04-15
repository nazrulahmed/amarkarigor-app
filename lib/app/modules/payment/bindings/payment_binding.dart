import 'package:amar_karigor/app/modules/booking/controllers/booking_controller.dart';
import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentController>(
       PaymentController(),
    );
    Get.put<BookingController>(
       BookingController(),
    );

  }
}

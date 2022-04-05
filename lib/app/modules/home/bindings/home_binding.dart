import 'package:amar_karigor/app/modules/booking/controllers/booking_controller.dart';
import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:amar_karigor/app/modules/location/controllers/location_controller.dart';
import 'package:amar_karigor/app/modules/support/controllers/support_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<LocationController>(LocationController());
    Get.put<BookingController>(BookingController());
    Get.put<CheckoutController>(CheckoutController());
    Get.put<SupportController>(SupportController());
  }
}

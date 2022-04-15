import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/data/providers/book_service_provider.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  String paymentType = 'cos';
  bool isCancelBooking = false;
  bool showCost = false;
  late double grossTotal;
  late int bookingId;
  late String serviceName;

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    bookingId = data['booking_id'];
    grossTotal = data['gross_total'];
    serviceName = data['service_name'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setPaymentType(String value) {
    this.paymentType = value;
    update();
  }

  void completeBooking() {
    if (paymentType == PAYMENT_CASH_ON_SERVICE) {
      Get.offAndToNamed(Routes.PAYMENT_COMPLETE);

      BookServiceProvider().updateBookingPaymentStatus(bookingId, 1);
    }
  }

  cancelBooking() {
    Get.toNamed(Routes.HOME);
  }
}

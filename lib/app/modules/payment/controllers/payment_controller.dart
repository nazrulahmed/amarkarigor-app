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

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    bookingId = data[0];
    grossTotal = data[1];
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

      BookServiceProvider().updateBookingPaymentStatus(bookingId);
    }
  }

  Future<bool> cancelBooking() async {
    await Future.delayed(Duration(seconds: 2));
    for (int i = 0; i < 22; i++) print('doing work with $i');
    return true;
  }
}

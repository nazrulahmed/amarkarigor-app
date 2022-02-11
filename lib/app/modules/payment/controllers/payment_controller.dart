import 'package:get/get.dart';

class PaymentController extends GetxController {
  String paymentType = 'cos';

  bool showCost = false;
  double costToPay = 0.0;

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

  void setPaymentType(String value) {
    this.paymentType = value;
    update();
  }

  void calculateCost() {
    costToPay = 76.0;
    update();
  }
}

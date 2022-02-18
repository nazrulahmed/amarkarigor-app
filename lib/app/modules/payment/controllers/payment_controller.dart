import 'package:get/get.dart';

class PaymentController extends GetxController {
  String paymentType = 'cos';

  bool showCost = false;
  double grossTotal = 0.0;

  @override
  void onInit() {
    super.onInit();
    grossTotal = Get.arguments as double;
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
}

import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/widget/custom_webview.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/payment_controller.dart';
import 'widget/cost_card.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment'),
        ),
        body: GetBuilder(
          builder: (PaymentController checkoutController) => ListView(
            children: [
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Select your payment method',
                  style: MyTextStyle.textBlackLargeBold,
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: PAYMENT_CASH_ON_SERVICE,
                    groupValue: controller.paymentType,
                    onChanged: (value) {
                      controller.setPaymentType(value as String);
                    },
                    activeColor: Colors.green,
                  ),
                  Text("Cash on service"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: PAYMENT_GATEWAY_ONLINE,
                    groupValue: controller.paymentType,
                    onChanged: (value) {
                      controller.setPaymentType(value as String);
                    },
                    activeColor: Colors.green,
                  ),
                  Text(PAYMENT_GATEWAY_ONLINE),
                ],
              ),
              Divider(),
              costCard(controller),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.HOME),
                        child: Text('Cancel'),
                        style: MyButtonStyle.cancelButton,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () =>
                            controller.paymentType == PAYMENT_CASH_ON_SERVICE
                                ? controller.completeBooking()
                                : showPaymentView(context),
                        child: controller.paymentType == PAYMENT_CASH_ON_SERVICE
                            ? Text('Proceed')
                            : Text('Pay now'),
                        style: MyButtonStyle.submitButton,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void cancelBookingAlert() {
    Get.dialog(Dialog(
      child: Container(
        height: 164,
        child: ListView(
          children: [
            SizedBox(
              height: 8,
            ),
            Center(
                child: Icon(Icons.info_outline_rounded,
                    size: 50, color: Colors.redAccent)),
            Center(
                child: Text(
              'Change your mind?',
              style: MyTextStyle.textBlackLargeBold,
            )),
            SizedBox(
              height: 12,
            ),
            Center(
                child: Text(
              'Do you want to cancel this booking?',
              style: MyTextStyle.textBlackSmall,
            )),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text('No'),
                    style: MyButtonStyle.alertCancelButton,
                  ),
                ),
                SizedBox(
                  width: 1,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => showLoadingDialog(),
                    child: Text('Yes'),
                    style: MyButtonStyle.alertConfirmButton,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void showLoadingDialog() async {
    Get.back();

    Get.dialog(Dialog(
      child: Container(
        height: 180,
        child: ListView(
          children: [
            SizedBox(
              height: 8,
            ),
            Center(
                child: Icon(Icons.info_outline_rounded,
                    size: 50, color: Colors.redAccent)),
            Center(
                child: Text(
              'Change your mind?',
              style: MyTextStyle.textBlackLargeBold,
            )),
          ],
        ),
      ),
    ));

    await controller.cancelBooking();
    Get.back();
  }

  void showPaymentView(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomWebView(controller.bookingId,controller.grossTotal,controller.serviceName)));
  }
}

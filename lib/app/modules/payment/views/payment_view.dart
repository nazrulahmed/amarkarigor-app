import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
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
                    value: PAYMENT_GATEWAY_BKASH,
                    groupValue: controller.paymentType,
                    onChanged: (value) {
                      controller.setPaymentType(value as String);
                    },
                    activeColor: Colors.green,
                  ),
                  Text(PAYMENT_GATEWAY_BKASH),
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
                        onPressed: () => controller.cancelBooking(),
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
                            controller.completeBooking(),
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
}

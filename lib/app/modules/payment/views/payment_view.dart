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
                    groupValue:controller.paymentType,
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

               Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(onPressed: ()=> controller.calculateCost(),
                 child: controller.paymentType==PAYMENT_CASH_ON_SERVICE? Text('Proceed')
                 :Text('Pay now'),
                 style: MyButtonStyle.submitButton,),
              )


            ],
          ),
        ));
  }
}

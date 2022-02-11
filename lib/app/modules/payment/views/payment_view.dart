import 'package:amar_karigor/app/global/config/app_style.dart';
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
                    value: 'cos',
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
                    value: 'bKash',
                    groupValue: controller.paymentType,
                    onChanged: (value) {
                      controller.setPaymentType(value as String);
                    },
                    activeColor: Colors.green,
                  ),
                  Text("bKash"),
                ],
              ),
              Divider(),

              costCard(controller),

               Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(onPressed: ()=> controller.calculateCost(),
                 child: controller.paymentType=='cos'? Text('Proceed'):Text('Pay now'),
                 style: MyButtonStyle.submitButton,),
              )


            ],
          ),
        ));
  }
}

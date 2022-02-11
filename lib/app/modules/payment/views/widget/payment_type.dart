import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/payment/controllers/payment_controller.dart';
import 'package:flutter/material.dart';

Widget paymentTypeView(PaymentController controller) {
  return Column(
    children: [
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
    ],
  );
}

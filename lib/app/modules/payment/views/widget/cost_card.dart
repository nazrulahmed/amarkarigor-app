import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/payment/controllers/payment_controller.dart';
import 'package:flutter/material.dart';

Widget costCard(PaymentController controller) {
  return Card(
    child: Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff6dc758),
            Color(0xff21ba3a),
            Color(0xff6dc758),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
                    controller.paymentType == 'cos'
                        ? 'You will be billed '
                        : 'Please pay ',
                    style: MyTextStyle.textWhiteExtraLargeBold)),
            Center(
                child: Text('BDT ${controller.grossTotal}',
                    style: MyTextStyle.textWhiteExtraLargeBold)),
          ],
        ),
      ),
    ),
  );
}

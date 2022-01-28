import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/checkout/views/widget/other_user_checkout.dart';
import 'package:amar_karigor/app/modules/checkout/views/widget/self_checkout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
        ),
        body: ListView(
          children: [
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'I want to process this booking for',
                style: MyTextStyle.textBlackLargeBold,
              ),
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: 1,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                ),
                Text("Myself"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                  activeColor: Colors.green,
                ),
                Text("Someone I know"),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: 1==1?selftCheckout(controller):otherUserCheckout(controller)
            
            ),
          ],
        ));
  }
}

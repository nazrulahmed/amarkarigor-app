import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/checkout/views/widget/other_user_checkout.dart';
import 'package:amar_karigor/app/modules/checkout/views/widget/self_checkout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class BookingPreview extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Booking Preview'),
        ),
        body: ListView(
          children: [
            
          ],
        ));
  }
}

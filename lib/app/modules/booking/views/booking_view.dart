import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:amar_karigor/app/modules/checkout/views/widget/cart_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'widget/booking_data.dart';
import 'widget/tab_bar_header.dart';

class BookingView extends GetView<BookingController> {
  final CheckoutController checkoutController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBarHeader(),
        body:  TabBarView(
          children: [
            cartData(checkoutController, context),
            bookingData(controller, context,1),
            bookingData(controller, context,2),
          ],
        ),
      ),
    );
  }
}

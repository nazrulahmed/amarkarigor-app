import 'package:amar_karigor/app/modules/checkout/views/widget/booking_data.dart';
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
      body: GetBuilder(builder: (CheckoutController checkoutController) {
        return bookingData(checkoutController, context);

      
      }),
    );
  }
}

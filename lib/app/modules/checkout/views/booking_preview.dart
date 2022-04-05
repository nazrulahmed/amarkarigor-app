import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/modules/checkout/views/widget/cart_data.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
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
        return ListView(
          children: [
            cartData(checkoutController, context),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    },
                    style: MyButtonStyle.submitButton,
                    child: Text('Add more')),
                ElevatedButton(
                    onPressed: () async {
                      int bookingId = await checkoutController.createBooking();
                      if (bookingId > 0) {
                        Get.offAllNamed(Routes.PAYMENT,arguments: [bookingId,controller.grossTotal]);
                      } else {
                        Get.showSnackbar(GetBar(
                            isDismissible: true,
                            duration: Duration(seconds: 2),
                            message: FAILED_MSG));
                      }
                    },
                    style: MyButtonStyle.submitButton,
                    child: Text('Next')),
              ],
            )
          ],
        );
      }),
    );
  }
}

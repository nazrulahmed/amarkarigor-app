import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentComplete extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          SvgPicture.asset(
            'assets/icons/booking_success.svg',
            height: 200,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Booking confirmed',
              style: TextStyle(
                  color: MyColors.colorPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              'Booking ref. ${controller.bookingId + 100}',
              style: TextStyle(
                  color: MyColors.colorPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'You wil receive an confirmaton email along with your booking details.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.HOME);
                },
                child: Text('Home'),
                style: MyButtonStyle.submitButton,
              ))
        ],
      ),
    );
  }
}

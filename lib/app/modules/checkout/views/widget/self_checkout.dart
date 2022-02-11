import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget selfCheckout(CheckoutController controller) {

  
  return !controller.hasInformation()
      ? Column(children: [
          Text(
              'Your profile is not completed yet! Please complete the required information to continue.',
              style: MyTextStyle.textBlackMediumBold),
              SizedBox(height: 4,),
          Text(
              'Once your profile is completd, you will be automatically taken to the checkout process.'),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(onPressed: ()=>controller.updateProfile(), child: Text('Update profile'),style: MyButtonStyle.submitButton,),
              )
        ])
      : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(onPressed: ()=>Get.toNamed(Routes.CHECKOUT_BOOKING_PREVIEW), child: Text('Next'),style: MyButtonStyle.submitButton,),
              );
}

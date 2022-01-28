import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/util/localdata.dart';
import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget selftCheckout(CheckoutController controller) {
  return LocalData.user == null
      ? Column(children: [
          Text(
              'Your profile is not completed yet! Please complete the required information to continue.',
              style: MyTextStyle.textBlackMediumBold),
              SizedBox(height: 4,),
          Text(
              'Once your profile is completd, you will be automatically taken to he checkout process.'),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(onPressed: ()=>controller.updateProfile(), child: Text('Update profile'),style: MyButtonStyle.submitButton,),
              )
        ])
      : Text('');
}
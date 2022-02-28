import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget otherUserCheckout(CheckoutController controller) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffeeeeee)),
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          controller: controller.consumerNameFieldController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            border: InputBorder.none,
            hintText: 'Consumer Name',
          ),
          keyboardType: TextInputType.text,
          onChanged: (num) {},
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffeeeeee)),
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          //  controller: controller.phoneInputFieldController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.apartment),
            border: InputBorder.none,
            hintText: 'Consumer Address',
          ),
          keyboardType: TextInputType.text,
          onChanged: (num) {},
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffeeeeee)),
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
            controller: controller.consumerPhoneFieldController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            border: InputBorder.none,
            hintText: 'Consumer Phone',
          ),
          keyboardType: TextInputType.phone,
          onChanged: (num) {},
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffeeeeee)),
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          controller: controller.consumerEmailFieldController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            border: InputBorder.none,
            hintText: 'Consumer Email',
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (num) {},
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Container(
            width: double.infinity,
            child: controller.isLoading.value == 1
                ? Center(
                    child: CircularProgressIndicator(
                    color: MyColors.colorPrimary,
                  ))
                : ElevatedButton(
                    onPressed: () async {
                      controller.previewBooking();
                    },
                    style: MyButtonStyle.submitButton,
                    child: Text('Next')),
          );
        }),
      ),
    ],
  );
}

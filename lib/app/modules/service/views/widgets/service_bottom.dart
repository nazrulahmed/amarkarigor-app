import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/service/controllers/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget serviceBottom(ServiceController controller) {
  return GestureDetector(
      onTap: () {
        for (var optionController in controller.optionControllers) {
          print(optionController.value);
          
        }
  
        for (var optionValues in controller.optionValues) {
          print(optionValues);
          
        }
      },
      child: Container(
        color: MyColors.colorPrimary,
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(()=> Text('\$${controller.totalPrice}',style:MyTextStyle.textWhiteMediumBold)),
            Text('Next',style:MyTextStyle.textWhiteMediumBold),
          ],
        )));
}

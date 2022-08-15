import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/checkout/views/widget/other_user_checkout.dart';
import 'package:amar_karigor/app/modules/checkout/views/widget/self_checkout.dart';
import 'package:amar_karigor/app/modules/home/views/widget/desktop/appbar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/util/platform_helper.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isDesktopView(context)
            ? null
            : AppBar(
                title: Text('Checkout'),
              ),
        body: GetBuilder(
          builder: (CheckoutController checkoutController) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isDesktopView(context)?CustomAppBar():SizedBox(),
              Center(
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.white,
                  width: kIsWeb
                      ? MediaQuery.of(context).size.width * .5
                      : double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Text(
                          'Booking type',
                          style: MyTextStyle.textBlackLargerBold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: controller.consumerType,
                            onChanged: (value) {
                              controller.setConsumerType(value as int);
                            },
                            activeColor: Colors.green,
                          ),
                          Text(
                            "Personal",
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: controller.consumerType,
                            onChanged: (value) {
                              controller.setConsumerType(value as int);
                            },
                            activeColor: Colors.green,
                          ),
                          Text("Corporate"),
                        ],
                      ),
                      Divider(),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: controller.consumerType == 1
                              ? selfCheckout(controller)
                              : otherUserCheckout(controller)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'If you\'re booking the services for your '
                  'office/workplace please select corporate!',
                  style: MyTextStyle.textBlackMediumBold,
                ),
              )
            ],
          ),
        ));
  }
}

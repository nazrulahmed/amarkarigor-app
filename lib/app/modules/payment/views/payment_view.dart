import 'dart:convert';

import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/data/model/user.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:amar_karigor/app/global/util/platform_helper.dart';
import 'package:amar_karigor/app/global/widget/custom_webview.dart';
import 'package:amar_karigor/app/modules/home/views/widget/desktop/appbar.dart';
import 'package:amar_karigor/app/modules/payment/controllers/payment_controller.dart';
import 'package:amar_karigor/app/modules/payment/views/widget/cost_card.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isDesktopView(context)
            ? null
            : AppBar(
                title: Text('Payment'),
              ),
        body: GetBuilder(
          builder: (PaymentController checkoutController) => Column(
            children: [
              kIsWeb ? CustomAppBar() : SizedBox(),
              Center(
                child: Container(
                  width: isDesktopView(context)
                      ? MediaQuery.of(context).size.width * .6
                      : double.infinity,
                  height: 600,
                  decoration: isDesktopView(context)
                      ? BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xffEEEEEE), width: 1),
                        )
                      : null,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Text(
                          'Select your payment method',
                          style: MyTextStyle.textBlackLargerBold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                border: Border.all(
                                  color: Color(0xffEEEEEE),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Radio(
                                    value: PAYMENT_CASH_ON_SERVICE,
                                    groupValue: controller.paymentType,
                                    onChanged: (value) {
                                      controller
                                          .setPaymentType(value as String);
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  Text(
                                    "Cash on service",
                                    style: MyTextStyle.textBlackLargeBold,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                border: Border.all(
                                  color: Color(0xffEEEEEE),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Radio(
                                    value: PAYMENT_GATEWAY_ONLINE,
                                    groupValue: controller.paymentType,
                                    onChanged: (value) {
                                      controller
                                          .setPaymentType(value as String);
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  Text(
                                    "Pay via Online",
                                    style: MyTextStyle.textBlackLargeBold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      costCard(controller),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () => Get.toNamed(Routes.HOME),
                                  child: Text('Cancel'),
                                  style: MyButtonStyle.cancelButton,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () => controller.paymentType ==
                                          PAYMENT_CASH_ON_SERVICE
                                      ? controller.completeBooking()
                                      : showPaymentView(context),
                                  child: controller.paymentType ==
                                          PAYMENT_CASH_ON_SERVICE
                                      ? Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text('Proceed'),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text('Pay now'),
                                        ),
                                  style: MyButtonStyle.submitButton,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void cancelBookingAlert() {
    Get.dialog(Dialog(
      child: Container(
        height: 190,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Center(
                child: Icon(Icons.info_outline_rounded,
                    size: 50, color: Colors.redAccent)),
            Center(
                child: Text(
              'Change your mind?',
              style: MyTextStyle.textBlackLargeBold,
            )),
            SizedBox(
              height: 12,
            ),
            Center(
                child: Text(
              'Do you want to cancel this booking?',
              style: MyTextStyle.textBlackSmall,
            )),
            SizedBox(
              height: 18,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text('No'),
                    style: MyButtonStyle.alertCancelButton,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Yes'),
                    style: MyButtonStyle.alertConfirmButton,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void showLoadingDialog() async {
    Get.back();

    Get.dialog(Dialog(
      child: Container(
        height: 180,
        child: ListView(
          children: [
            SizedBox(
              height: 8,
            ),
            Center(
                child: Icon(Icons.info_outline_rounded,
                    size: 50, color: Colors.redAccent)),
            Center(
                child: Text(
              'Change your mind?',
              style: MyTextStyle.textBlackLargeBold,
            )),
          ],
        ),
      ),
    ));

    await controller.cancelBooking();
    Get.back();
  }

  void showPaymentView(context) async {
    controller.startTimer();
    if (kIsWeb) {
      User user = LocalData.user!;
      String payload =
          "{\"token\":\"80535d79-b11a-447e-b9b4-1b941c2a3a6f\",\"booking_id\":"
          "${controller.bookingId},\"uid\":${user.uid},\"amount\":"
          "${controller.grossTotal},\"cus_name\":\"${user.firstName}\","
          "\"cus_email\":\"${user.email}\",\"cus_phone\":\"${user.phone}\","
          "\"cus_address\":\"${user.address}\","
          "\"service_name\":\"${controller.serviceName}\"}";
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded = stringToBase64.encode(payload);

      await launch(
          '${Api.ssl_payment_url}payment/ssl_commerz?payload=' + encoded);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CustomWebView(
                  controller.bookingId,
                  controller.grossTotal,
                  controller.serviceName,
                  controller.categoryId)));
    }
  }
}

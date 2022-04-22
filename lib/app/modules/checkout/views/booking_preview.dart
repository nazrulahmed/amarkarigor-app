import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/data/model/user.dart';
import 'package:amar_karigor/app/modules/booking/views/widget/service_attributes.dart';
import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/util/platform_helper.dart';
import '../../home/views/widget/desktop/appbar.dart';

class BookingPreview extends GetView<CheckoutController> {
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
   
    User? consumer;

    if (args != null) {
      consumer = args['consumer'];
     
    } else {

    }

    return Scaffold(
        appBar: isDesktopView(context)
            ? CustomAppBar()
            : AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Get.back();
                    }),
                title: Text('Booking Preview',
                    style: TextStyle(color: Colors.black)),
                backgroundColor: Colors.white,
              ),
        body: 
        
        GetBuilder(builder:  (CheckoutController checkoutController) => 
        controller.booking==null?SizedBox():Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              decoration: isDesktopView(context)
                  ? BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffdddddd), width: 1),
                    )
                  : null,
              width: isDesktopView(context)
                  ? MediaQuery.of(context).size.width * .5
                  : double.infinity,
              padding: isDesktopView(context) ? EdgeInsets.all(20) : null,
              child: ListView(
                children: [
                  Text(
                    controller.booking!.service['name'],
                    style: MyTextStyle.textBlackLargerBold,
                  ),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ServiceAttribute(controller.booking!.selectedOptions),
                  )),
                  SizedBox(height: 4),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green[50],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('Booking Date',
                                    style: MyTextStyle.textGreenMediumBold),
                                SizedBox(height: 2),
                                Row(children: [
                                  Icon(Icons.calendar_today,
                                      color: Colors.green),
                                  SizedBox(width: 5),
                                  Text('${controller.booking!.bookingDate}',
                                      style: MyTextStyle.textGreenMediumBold)
                                ]),
                              ]),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green[50],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text('Booking Time',
                                    style: MyTextStyle.textGreenMediumBold),
                                SizedBox(height: 2),
                                Row(children: [
                                  Icon(Icons.access_time, color: Colors.green),
                                  SizedBox(width: 5),
                                  Text('${controller.booking!.bookingTime}',
                                      style: MyTextStyle.textGreenMediumBold)
                                ]),
                              ]),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: 12),
                  consumer != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            Text(
                              'This service is booked for ${consumer.firstName}',
                              style: MyTextStyle.textBlackMediumBold,
                            ),
                            Text("booking details"),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Consumer Name: "),
                                        Text("${consumer.firstName}"),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        Text("Consumer Address: "),
                                        Text("${consumer.address}"),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        Text("Consumer Phone: "),
                                        Text("${consumer.phone}"),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        Text("Consumer Email: "),
                                        Text("${consumer.email}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : Text(''),
                  Obx(() => controller.creatingBooking.value
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () => controller.createBooking(),
                            child: Text('Proceed'),
                            style: MyButtonStyle.submitButton,
                          ),
                        ))
                ],
              ),
            ),
          ),
        )));
  }
}

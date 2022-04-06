import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/data/model/booking.dart';
import 'package:amar_karigor/app/global/data/model/user.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_controller.dart';
import 'widget/service_attributes.dart';

class BookingDetails extends GetView<BookingController> {
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.hasConsumerData.value = false;
    int index = -1;
    int status = 0;
    Color? backgroundColor = Colors.blue[100];
    Color? flagColor = Colors.blue;

    Booking? bookingData;
    User? consumer;
    void setConsumerData(value) {
      if (value != null) {
        consumer = value;
        controller.hasConsumerData.value = true;
      }
    }

    if (args != null) {
      index = args['index'];
      status = args['status'];
      if (status == 1) {
        bookingData = controller.incompleteBookings[index];
      } else {
        bookingData = controller.completeBookings[index];
      }
      controller
          .consumerInfo(bookingData.id!)
          .then((value) => setConsumerData(value));
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Get.back();
            }),
        title: Text('Booking details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: index == -1
          ? SizedBox()
          : bookingData != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListView(
                      children: [
                        Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('REF #${bookingData.id}',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 20)),
                              )),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              bookingData.serviceName!,
                              style: MyTextStyle.textBlackLargerBold,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('${bookingData.status}',
                                      style: TextStyle(color: flagColor)),
                                ))
                          ],
                        ),
                        Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ServiceAttribute(bookingData.attribute),
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
                                          style:
                                              MyTextStyle.textGreenMediumBold),
                                      SizedBox(height: 2),
                                      Row(children: [
                                        Icon(Icons.calendar_today,
                                            color: Colors.green),
                                        SizedBox(width: 5),
                                        Text('${bookingData.bookingDate}',
                                            style:
                                                MyTextStyle.textGreenMediumBold)
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
                                          style:
                                              MyTextStyle.textGreenMediumBold),
                                      SizedBox(height: 2),
                                      Row(children: [
                                        Icon(Icons.access_time,
                                            color: Colors.green),
                                        SizedBox(width: 5),
                                        Text('${bookingData.bookingTime}',
                                            style:
                                                MyTextStyle.textGreenMediumBold)
                                      ]),
                                    ]),
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(height: 12),
                        Obx(
                          () => controller.hasConsumerData.value
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(),
                                    Text(
                                      'This service is booked for ${consumer!.firstName}',
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
                                                Text("${consumer!.firstName}"),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              children: [
                                                Text("Consumer Address: "),
                                                Text("${consumer!.address}"),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              children: [
                                                Text("Consumer Phone: "),
                                                Text("${consumer!.phone}"),
                                              ],
                                            ),
                                            Divider(),
                                            Row(
                                              children: [
                                                Text("Consumer Email: "),
                                                Text("${consumer!.email}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Text(
                                  '',
                                  style: MyTextStyle.textBlackMediumBold,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () =>
                                Get.toNamed(Routes.PAYMENT, arguments: {'booking_id':int.parse(bookingData!.id!),'gross_total':bookingData.totalToPay}),
                            child: Text('Complete Now'),
                            style: MyButtonStyle.submitButton,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(),
    );
  }
}

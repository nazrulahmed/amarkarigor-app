import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            controller.increment();
          },
          child: Obx(
            () => Text(
              'BookingView is working ${controller.count.value}',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

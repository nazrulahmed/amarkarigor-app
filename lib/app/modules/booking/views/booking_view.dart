import 'package:amar_karigor/app/global/util/platform_helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'widget/booking_data.dart';
import 'widget/tab_bar_header.dart';

class BookingView extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return isDesktopView(context)?SizedBox(): DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBarHeader(),
        body:  TabBarView(
          children: [
            bookingData(controller, context,1),
            bookingData(controller, context,2),
          ],
        ),
      ),
    );
  }
}

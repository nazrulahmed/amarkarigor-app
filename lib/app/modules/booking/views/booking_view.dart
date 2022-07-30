import 'package:amar_karigor/app/global/util/platform_helper.dart';
import 'package:amar_karigor/app/modules/booking/views/widget/tab_bar_header.dart';
import 'package:amar_karigor/app/modules/home/views/widget/desktop/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'widget/booking_data.dart';

class BookingView extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return isDesktopView(context)
        ? DesktopViewBooking(controller)
        : MobileViewBooking(controller);
  }
}

class MobileViewBooking extends StatelessWidget {
  final BookingController controller;
  MobileViewBooking(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabView(controller),
    );
  }
}

class DesktopViewBooking extends StatelessWidget {
  final BookingController controller;
  DesktopViewBooking(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: TabView(controller),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  final BookingController controller;
  TabView(this.controller);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBarHeader(),
        body: TabBarView(
          children: [
            bookingData(controller, context, 1),
            bookingData(controller, context, 2),
          ],
        ),
      ),
    );
  }
}

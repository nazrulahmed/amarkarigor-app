import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/data/model/booking.dart';
import 'package:amar_karigor/app/global/util/platform_helper.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;
import 'package:amar_karigor/app/modules/booking/controllers/booking_controller.dart';
import 'package:amar_karigor/app/modules/booking/views/widget/tab_bar_header.dart';
import 'package:amar_karigor/app/modules/home/views/widget/desktop/appbar.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Center(
              child: Container(
                width: desktopWindowIdealSize,
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.activeTab(1);

                          controller.getBookings(1);
                          controller.update();
                        },
                        child: Obx(
                          () => Container(
                            alignment: AlignmentDirectional.center,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: controller.activeTab.value == 1
                                      ? MyColors.colorPrimary
                                      : Colors.white,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                "Incomplete",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.activeTab(2);
                          controller.getBookings(2);
                          controller.update();
                        },
                        child: Obx(
                          () => Container(
                            alignment: AlignmentDirectional.center,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: controller.activeTab.value == 2
                                      ? MyColors.colorPrimary
                                      : Colors.white,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Complete",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder(builder: (BookingController bc) {
              return Expanded(
                child: ListView.builder(
                    itemCount: controller.activeTab.value == 1
                        ? controller.incompleteBookings.length
                        : controller.completeBookings.length,
                    itemBuilder: (context, index) {
                      return UnconstrainedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xffEEEEEE),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width >
                                  desktopWindowIdealSize
                              ? desktopWindowIdealSize
                              : MediaQuery.of(context).size.width,
                          child: bookingItem(
                              controller, index, controller.activeTab.value),
                        ),
                      );
                    }),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget bookingItem(
      BookingController bookingController, int index, int status) {
    Booking bookingData;
    if (status == 1) {
      bookingData = bookingController.incompleteBookings[index];
    } else {
      bookingData = bookingController.completeBookings[index];
    }
    return InkWell(
      onTap: () => Get.toNamed(Routes.BOOKING_DETAILS,
          arguments: {'index': index, 'status': status}),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red[400]),
        onDismissed: (DismissDirection direction) async {
          await bookingController.removeBooking(bookingData.id!, status);
        },
        direction: DismissDirection.endToStart,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      kIsWeb
                          ? ci.CustomImage(
                              bookingData.icon!,
                              '${Api.assets_url}${Api.services_icon}${bookingData.icon}',
                              40,
                              40)
                          : Image.network(
                              '${Api.assets_url}${Api.services_icon}${bookingData.icon}',
                              height: 40,
                              width: 40,
                            ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '# ${bookingData.id}',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            bookingData.serviceName!,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today_rounded,
                          color: Colors.blueGrey[700]),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${bookingData.bookingDate}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[700]),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Icon(Icons.access_time, color: Colors.blueGrey[700]),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${bookingData.bookingTime}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[700]),
                      ),
                    ],
                  ),
                ),
                Text(
                  '৳ ${bookingData.totalToPay}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.colorPrimary),
                ),
              ]),
        ),
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
            GetBuilder(builder: (BookingController bc) {
              return bookingData(controller, context, 1);
            }),
            GetBuilder(builder: (BookingController bc) {
              return bookingData(controller, context, 2);
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/data/model/my_booking_data.dart';
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;

Widget bookingData(CheckoutController checkoutController, context) {
  CustomShimmer customShimmer = CustomShimmer();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          child: checkoutController.bookings.length == 0
              ? ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return customShimmer.multiShimmerContainer([
                      customShimmer.getShimmerFromColor(width: 60, height: 60),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customShimmer.getShimmerFromColor(
                              width: MediaQuery.of(context).size.width * .7,
                              height: 10,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(
                              width: MediaQuery.of(context).size.width * .65,
                              height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(
                              width: MediaQuery.of(context).size.width * .6,
                              height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                        ],
                      ),
                    ]);
                  })
              : ListView.builder(
                  itemCount: checkoutController.bookings.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return item(checkoutController, index);
                  })),
    ],
  );
}

Widget item(CheckoutController checkoutController, int index) {
  MyBookingData bookingData = checkoutController.bookings[index];
  return InkWell(
    onTap: () => checkoutController.removeBooking(index),
    child: Dismissible(
      key: Key(index.toString()),
      background: Container(color: Colors.red[400]),
      onDismissed: (DismissDirection direction) {},
      direction: DismissDirection.endToStart,
      child: Container(
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kIsWeb
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: ci.CustomImage(
                                  bookingData.service.name,
                                  '${Api.assets_url}${Api.services_icon}${bookingData.service.icon}',
                                  40,
                                  40),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.network(
                                '${Api.assets_url}${Api.services_icon}${bookingData.service.icon}',
                                height: 40,
                                width: 40,
                              ),
                            ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookingData.service.name + " cleaning Service",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, right: 8),
                        child: Text(
                          '৳ ${bookingData.totalPrice}',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: MyColors.colorPrimary),
                        ),
                      ),
                    ]),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              )
            ],
          ),
        ),
      ),
    ),
  );
}

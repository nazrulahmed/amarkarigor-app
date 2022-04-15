import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/util/my_formatter.dart';
import 'package:amar_karigor/app/modules/service/controllers/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/platform_helper.dart';

class CustomTimeSelector extends StatelessWidget {
  final ServiceController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Widget getTimeSlot(String time) {
      return GestureDetector(
        onTap: () {
          controller.setSelectedTime(time);
        },
        child: Container(
          margin: isDesktopView(context)
              ? EdgeInsets.all(12)
              : EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              color: controller.bookingTime == time
                  ? MyColors.colorPrimary
                  : Colors.white,
              border: Border.all(color: MyColors.colorPrimary),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                time,
                style: controller.bookingTime == time
                    ? MyTextStyle.textWhiteMediumBold
                    : MyTextStyle.textBlackMediumBold,
              ),
            ),
          ),
        ),
      );
    }

    List<Widget> timeSlots = [];

    DateTime currentTime = controller.currentDate.value;
    DateTime addedTime = currentTime;
    int min = 0;

    if (currentTime.hour >= MAX_TIME) {
      addedTime = addedTime.add(Duration(days: 1));
      print('1 day added. and time after aded is');
      print(addedTime.toString());
      addedTime =
          DateTime(addedTime.year, addedTime.month, addedTime.day, 7, 30);
    }
    while (addedTime.hour < MAX_TIME) {
      addedTime = addedTime.add(Duration(minutes: 30));
      if (addedTime.minute >= 30) {
        min = 30;
      } else {
        min = 0;
      }

      timeSlots.add(getTimeSlot(
          "${MyFormatter.convertTo12hrFormat(addedTime.hour, min)}"));
    }

    return Container(
      height: isDesktopView(context) ? 300 : 40,
      width: double.infinity,
      child: ListView(
        scrollDirection:
            isDesktopView(context) ? Axis.vertical : Axis.horizontal,
        children: timeSlots,
      ),
    );
  }
}

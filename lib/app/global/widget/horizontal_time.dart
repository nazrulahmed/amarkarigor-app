import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/modules/service/controllers/service_controller.dart';
import 'package:flutter/material.dart';

Widget horizontalTime(ServiceController controller) {
  List<Widget> timeSlots = [];

  DateTime currentTime = controller.currentDate.value;
  DateTime addedTime = currentTime;
  int min = 0;

  if (currentTime.hour > MAX_TIME) {
    addedTime = addedTime.add(Duration(days: 1));
    print('1 day added. and time after aded is');
    print(addedTime.toString());
    addedTime = DateTime(addedTime.year, addedTime.month, addedTime.day, 8, 0);
  }
  while (addedTime.hour < MAX_TIME) {
    addedTime = addedTime.add(Duration(minutes: 30));
    if (addedTime.minute >= MAX_TIME) {
      min = 30;
    } else {
      min = 0;
    }
    String hours = addedTime.hour.toString();
    String minutes = min < 10 ? '0$min' : min.toString();

    timeSlots.add(getTimeSlot(controller, "${addedTime.hour}:$minutes"));
  }

  return Container(
    height: 40,
    width: double.infinity,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: timeSlots,
    ),
  );
}

Widget getTimeSlot(ServiceController controller, String time) {
  return GestureDetector(
    onTap: () {
      controller.setSelectedTime(time);
    },
    child: Container(
      margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: controller.selectedTime == time
              ? MyColors.colorPrimary
              : Colors.white,
          border: Border.all(color: MyColors.colorPrimary),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            time,
            style: controller.selectedTime == time
                ? MyTextStyle.textWhiteMediumBold
                : MyTextStyle.textBlackMediumBold,
          ),
        ),
      ),
    ),
  );
}

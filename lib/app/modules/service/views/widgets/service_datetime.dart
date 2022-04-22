import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/widget/custom_time_selector.dart';
import 'package:amar_karigor/app/modules/service/controllers/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

Widget serviceDateTime(ServiceController controller) {
  if (controller.service == null) return Container();

  return Padding(
    padding: const EdgeInsets.all(0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Wanted date', style: MyTextStyle.textBlackLargeBold),
        ),
        TableCalendar(
            calendarStyle: CalendarStyle(
              todayDecoration: const BoxDecoration(
                  color: Color(0xff1DBF73), shape: BoxShape.circle),
            ),
            firstDay: controller.currentDate.value,
            lastDay: controller.currentDate.value.add(new Duration(days: 14)),
            focusedDay: controller.selectedDate.value,
            calendarFormat: CalendarFormat.week,
            availableCalendarFormats: const {
              CalendarFormat.week: 'Week',
            },
            currentDay: controller.selectedDate.value,
            onDaySelected: (d, d1) {
              controller.setSelectedDate(d1);
            }),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Wanted time', style: MyTextStyle.textBlackLargeBold),
        ),
        SizedBox(height: 8),
        CustomTimeSelector(),
        SizedBox(height: 12)
      ],
    ),
  );
}

import 'package:amar_karigor/app/modules/service/controllers/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

Widget serviceDateTime(ServiceController controller) {
  DateTime currentDateTime = DateTime.now();
  return TableCalendar(
      firstDay: currentDateTime,
      lastDay: currentDateTime.add(new Duration(days: 14)),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {
        CalendarFormat.week: 'Week',
      },
      onDaySelected: (d, d1) {
        String selectedDate = "${d1.day}${d1.month}${d1.year}";
      });
}

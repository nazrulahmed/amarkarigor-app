import 'dart:collection';
import 'dart:convert';

import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/data/model/my_booking_data.dart';
import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum ServicePages { SERVICE_OPTION, SERVICE_TIME }

class ServiceController extends GetxController {
  late final Service service;
  List optionControllers = [];
  List<Map<String, dynamic>> optionValues = [];
  var totalPrice = 0.0.obs;
  var selectedDate = DateTime.now().obs;
  var currentDate = DateTime.now().obs;
  var servicePage = ServicePages.SERVICE_OPTION.obs;

  String bookingTime = "";
  String bookingDate = "";

  @override
  void onInit() {
    super.onInit();

    if (currentDate.value.hour >= MAX_TIME) {
      currentDate.value = currentDate.value.add(Duration(days: 1));
      selectedDate.value = currentDate.value;
    }

    print('currentDate is OUT ${currentDate.value.hour}');
    service = Get.arguments;
    totalPrice.value = service.price;
    bookingDate =
        "${selectedDate.value.day}-${selectedDate.value.month}-${selectedDate.value.year}";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setSelectedDate(DateTime d1) {
    bookingDate = "${d1.day}-${d1.month}-${d1.year}";
    selectedDate.value = d1;
    update();
  }

  void setCurrentDate(DateTime date) {
    currentDate.value = date;
    update();
  }

  void prevPage() {
    servicePage.value = ServicePages.SERVICE_OPTION;
    update();
  }

  Future<String?> proceedBooking() async {
    if (servicePage.value == ServicePages.SERVICE_OPTION) {
      servicePage.value = ServicePages.SERVICE_TIME;
      update();
      return null;
    }
    if (bookingTime.isEmpty) {
      return "Please select wanted time!";
    }

    //TO DO: Restructure mapping system
    Map<String, dynamic> selectedAttributes = HashMap();
    for (var optionValues in optionValues) {
      selectedAttributes.addAll(optionValues);
    }
    final finalAttribute = json.encode(selectedAttributes);
    print('GOING TO FINAL MAP');
    //var box = await Hive.openBox(BOOKING_BOX_NAME);

    MyBookingData booking = MyBookingData(service.toJson(), finalAttribute,
        totalPrice.value, bookingDate, bookingTime);
    //box.add(booking);

    //print('box.length after added ${box.length}');

    Get.toNamed(Routes.CHECKOUT,arguments: {'booking':booking,'total_price':totalPrice.value});
  }

  void setSelectedTime(String time) {
    bookingTime = time;
    update();
  }
}

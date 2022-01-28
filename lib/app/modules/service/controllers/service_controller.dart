import 'dart:collection';

import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/model/service.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';

enum ServicePages { SERVICE_OPTION, SERVICE_TIME }

class ServiceController extends GetxController {
  late final Service service;
  List optionControllers = [];
  List<Map<String, dynamic>> optionValues = [];
  var totalPrice = 0.0.obs;
  var selectedDate = DateTime.now().obs;
  var currentDate = DateTime.now().obs;
  var servicePage = ServicePages.SERVICE_OPTION.obs;

  String selectedTime = "";
  String selectedDateString = "";

  @override
  void onInit() {
    super.onInit();
    if (currentDate.value.hour > MAX_TIME) {
      currentDate.value = currentDate.value.add(Duration(days: 1));
      selectedDate.value = currentDate.value;
    }
    service = Get.arguments;
    totalPrice.value = service.price;
    selectedDateString =
        "${selectedDate.value.day}-${selectedDate.value.month}-${selectedDate.value.year}";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setSelectedDate(DateTime d1) {
    selectedDateString = "${d1.day}-${d1.month}-${d1.year}";
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

  String? proceedBooking() {
    if (servicePage.value == ServicePages.SERVICE_OPTION) {
      servicePage.value = ServicePages.SERVICE_TIME;
      update();
      return null;
    }
    if (selectedTime.isEmpty) {
      return "Please select wanted time!";
    }
    optionValues.add({'selected_date': selectedDateString});
    optionValues.add({'selected_time': selectedTime});

    //TO DO: Restructure mapping system
    Map<String, dynamic> finalMap = HashMap();
    for (var optionValues in optionValues) {
      finalMap.addAll(optionValues);
    }
    print('GOING TO FINAL MAP');
    Get.toNamed(Routes.CHECKOUT, arguments: finalMap);
  }

  void setSelectedTime(String time) {
    selectedTime = time;
    update();
  }
}

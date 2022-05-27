import 'dart:collection';
import 'dart:convert';

import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/data/model/my_booking_data.dart';
import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../global/util/app_pref.dart';

enum ServicePages { SERVICE_OPTION, SERVICE_TIME }

class ServiceController extends GetxController {
  Future<AppPref?> myPref = AppPref.instance;
  Service? service;
  List optionControllers = [];
  List<Map<String, dynamic>> optionValues = [];
  var totalPrice = 0.0.obs;
  var selectedDate = DateTime.now().obs;
  var currentDate = DateTime.now().obs;
  var servicePage = ServicePages.SERVICE_OPTION.obs;

  String bookingTime = "";
  String bookingDate = "";

  @override
  void onInit() async {
    super.onInit();

    service = Get.arguments;
    AppPref? appPref = await myPref;

    if (currentDate.value.hour >= MAX_TIME) {
      currentDate.value = currentDate.value.add(Duration(days: 1));
      selectedDate.value = currentDate.value;
    }
    if (service != null) {
      print('SERVICE NOT EQUAL TO NULL');
      if (kIsWeb && appPref != null) {
        print('App pref not NULL');

        appPref.saveService(json.encode(service!.toJson()));
        print('data saved');
        print('data retriving');
        String? serviceData = await appPref.retriveService();

        print(json.decode(serviceData!));
      }
      totalPrice.value = service!.price;
      bookingDate =
          "${selectedDate.value.day}-${selectedDate.value.month}-${selectedDate.value.year}";
    } else {
      print('SERVICE IS NULL');

      if (kIsWeb) {
        print('kIsWeb');

        String? serviceData = await appPref!.retriveService();
        print('service $service');

        Map<String, dynamic> serviceMap = json.decode(serviceData!);

        service = Service(
            serviceMap['id'] as int,
            serviceMap['name'],
            serviceMap['price'] as double,
            serviceMap['cat_id'] as int,
            serviceMap['sub_cat_id'] as int,
            serviceMap['icon'],
            serviceMap['description'],
            serviceMap['attribute'],
            serviceMap['option']);
        print('service converted to obj');
        print('service json');

           
      totalPrice.value = service!.price;
      bookingDate =
          "${selectedDate.value.day}-${selectedDate.value.month}-${selectedDate.value.year}";
        




        update();
      }
    }
    print('on init finished');
  }

  @override
  void onReady() {
    super.onReady();
    print('on ready');
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
    MyBookingData booking = MyBookingData(service!.toJson(), finalAttribute,
        totalPrice.value, bookingDate, bookingTime);

    Get.toNamed(Routes.CHECKOUT,
        arguments: {'booking': booking, 'total_price': totalPrice.value,'category_id':service!.catId});
    return '';
  }

  void setSelectedTime(String time) {
    bookingTime = time;
    update();
  }
}

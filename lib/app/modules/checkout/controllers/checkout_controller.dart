import 'dart:convert';

import 'package:amar_karigor/app/global/data/model/consumer.dart';
import 'package:amar_karigor/app/global/data/model/my_booking_data.dart';
import 'package:amar_karigor/app/global/data/model/user.dart';
import 'package:amar_karigor/app/global/data/providers/book_service_provider.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../global/util/app_pref.dart';

class CheckoutController extends GetxController {
  Future<AppPref?> myPref = AppPref.instance;

  MyBookingData? booking;
  final BookServiceProvider _bookServiceProvider = BookServiceProvider();
  int consumerType = 1;
  var isLoading = false.obs;
  double grossTotal = 0.0;
  var creatingBooking = false.obs;
  int categoryId = 0;

  TextEditingController consumerNameFieldController = TextEditingController();
  TextEditingController consumerAddressFieldController =
      TextEditingController();
  TextEditingController consumerPhoneFieldController = TextEditingController();
  TextEditingController consumerEmailFieldController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    AppPref? pref = await myPref;
    if (Get.arguments != null) {
      booking = Get.arguments['booking'];
      categoryId = Get.arguments['category_id'];
      grossTotal = Get.arguments['total_price'];
      pref!.saveBooking(json.encode(booking!.toJson()));
      pref.saveGrossTotal(grossTotal);
      pref.saveCategoryId(categoryId);
    } else {
      String userData = pref!.retriveUserInfo();
      var ud = json.decode(userData);
      User user =
          User.fromJson(pref.retriveUserId()!, pref.retriveToken()!, ud);
      LocalData.user = user;
      Map<String, dynamic> bookingData = json.decode(pref.retriveBooking());
      MyBookingData myBookingData = MyBookingData({
        "id": bookingData['service_id'],
        "name": bookingData['service_name'],
        "icon": bookingData['service_icon']
      }, bookingData['selected_attributes'], bookingData['total_price'],
          bookingData['booking_date'], bookingData['booking_time']);

      booking = myBookingData;

      grossTotal = pref.retriveGrossTotal();

      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> createBooking() async {
    creatingBooking.value = true;
    Consumer? consumer;
    if (consumerType == 2) {
      consumer = Consumer(
          consumerNameFieldController.text,
          consumerAddressFieldController.text,
          consumerPhoneFieldController.text,
          consumerEmailFieldController.text);
    }
    http.Response response = await _bookServiceProvider.createBooking(
        booking!, grossTotal, consumer);
    creatingBooking.value = false;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        int bookingId = data['booking_id'] as int;
        Get.toNamed(Routes.PAYMENT, arguments: {
          'booking_id': bookingId,
          'category_id': categoryId,
          'gross_total': grossTotal,
          'service_name': booking!.service['name']
        });
      }
    }

    return;
  }

  void updateProfile() {
    Get.toNamed(Routes.UPDATE_PROFILE);
  }

  void removeBooking(int index) {
    update();
  }

  void setConsumerType(int value) {
    consumerType = value;
    update();
  }

  bool hasInformation() {
    print("LocalData.user::::::::: ${LocalData.user}");
    return LocalData.user != null && LocalData.user!.profileCompleted();
  }

  void previewBooking(bool isSelf) {
    User? consumer;
    if (!isSelf) {
      consumer = User('', '');
      consumer.setFirstName = consumerNameFieldController.text;
      consumer.setPhone = consumerPhoneFieldController.text;
      consumer.setAddress = consumerAddressFieldController.text;
      consumer.setEmail = consumerEmailFieldController.text;
    }
    print('booking::::::::::from PREVIEEW::::::::::: ');
    print('booking info');
    print(booking!.service);
    print(booking!.selectedOptions);
    Get.toNamed(Routes.CHECKOUT_BOOKING_PREVIEW,
        arguments: {'booking': booking, 'consumer': consumer});
  }
}

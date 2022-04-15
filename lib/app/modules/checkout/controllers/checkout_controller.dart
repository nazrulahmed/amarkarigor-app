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

class CheckoutController extends GetxController {
 
  late MyBookingData booking;
  final BookServiceProvider _bookServiceProvider = BookServiceProvider();
  int consumerType = 1;
  var isLoading = false.obs;
  double grossTotal = 0.0;
  var creatingBooking = false.obs;

  TextEditingController consumerNameFieldController = TextEditingController();
  TextEditingController consumerAddressFieldController =
      TextEditingController();
  TextEditingController consumerPhoneFieldController = TextEditingController();
  TextEditingController consumerEmailFieldController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      booking = Get.arguments['booking'];
      grossTotal = Get.arguments['total_price'];
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
    http.Response response =
        await _bookServiceProvider.createBooking(booking, grossTotal, consumer);
    creatingBooking.value = false;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        int bookingId = data['booking_id'] as int;
        Get.toNamed(Routes.PAYMENT,
            arguments: {'booking_id': bookingId, 'gross_total': grossTotal,'service_name':booking.service['name']});
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
    Get.toNamed(Routes.CHECKOUT_BOOKING_PREVIEW,
        arguments: {'booking': booking, 'consumer': consumer});
  }
}

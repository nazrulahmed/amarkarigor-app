import 'dart:convert';

import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/data/model/my_booking_data.dart';
import 'package:amar_karigor/app/global/data/providers/book_service_provider.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class CheckoutController extends GetxController {
  late Box bookingBox;
  final BookServiceProvider _bookServiceProvider = BookServiceProvider();
  List<MyBookingData> bookings = [];
  int consumerType = 1;
  var isLoading = false.obs;
  double grossTotal = 0.0;
  @override
  void onInit() async {
    super.onInit();
    bookingBox = await Hive.openBox(BOOKING_BOX_NAME);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<int> createBooking() async {
    http.Response response =
        await _bookServiceProvider.createBooking(bookings, grossTotal);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        return data['booking_id'] as int;
      }
    }
    return -1;
  }

  void updateProfile() {
    Get.toNamed(Routes.UPDATE_PROFILE);
  }

  void removeBooking(int index) {
    bookingBox.deleteAt(index);
    bookings.removeAt(index);
    update();
  }

  void setConsumerType(int value) {
    consumerType = value;
    update();
  }

  bool hasInformation() {
    return LocalData.user != null && LocalData.user!.profileCompleted();
  }

  void clearBooking() {}
  void previewBooking() {
    bookings.clear();
    grossTotal = 0;

    for (int i = 0; i < bookingBox.length; i++) {
      MyBookingData bookingData = bookingBox.getAt(i);

      grossTotal += bookingData.totalPrice;

      bookings.add(bookingData);
    }
    update();
    Get.toNamed(Routes.CHECKOUT_BOOKING_PREVIEW);
  }
}

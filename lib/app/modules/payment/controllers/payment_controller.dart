import 'dart:async';
import 'dart:convert';

import 'package:amar_karigor/app/global/config/constant.dart';
import 'package:amar_karigor/app/global/data/providers/book_service_provider.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../global/util/app_pref.dart';

class PaymentController extends GetxController {
  String paymentType = 'cos';
  bool isCancelBooking = false;
  bool showCost = false;
  double grossTotal = 0;
  int bookingId = 0;
  int categoryId = 0;
  String serviceName = 'home service';
  Future<AppPref?> myPref = AppPref.instance;
  BookServiceProvider bookServiceProvider = BookServiceProvider();
  late Timer timer;
  final DatabaseReference bookingRef = FirebaseDatabase.instance.ref('booking');
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    AppPref? pref = await myPref;
    var data = Get.arguments;
    if (data != null) {
      bookingId = data['booking_id'];
      categoryId = data['category_id'];
      grossTotal = data['gross_total'];
      serviceName = data['service_name'];

      pref!.saveBookingId(bookingId);
      pref.saveGrossTotal(grossTotal);
      pref.saveServiceName(serviceName);
    } else {
      categoryId = pref!.retriveCategoryId();
      bookingId = pref.retriveBookingId();
      grossTotal = pref.retriveGrossTotal();
      serviceName = pref.retriveServiceName();
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        checkPaymentStatus();
      },
    );
  }

  @override
  void onClose() {}

  void setPaymentType(String value) {
    this.paymentType = value;
    update();
  }

  void completeBooking() {
    if (paymentType == PAYMENT_CASH_ON_SERVICE) {
      Get.offAndToNamed(Routes.PAYMENT_COMPLETE);
      sendToWorkerApp();
      bookServiceProvider.updateBookingPaymentStatus(bookingId, 1);
    }
  }

  void sendToWorkerApp() {
    bookingRef.child("cid-$categoryId").child("bid-$bookingId").set({
      "bid": bookingId.toString(),
      "current_status": 1,
      "receiver_id": "-1",
      "uid": int.parse(LocalData.user!.uid)
    });
  }

  cancelBooking() {
    Get.toNamed(Routes.HOME);
  }

  void checkPaymentStatus() async {
    http.Response response =
        await bookServiceProvider.getPaymentStatus(bookingId);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == true) {
        final response = data['response'];

        if (response['status'] == "2" && response['payment_method'] == "2") {
          print("I am inside IF");
          sendToWorkerApp();
          timer.cancel();
          Get.toNamed(Routes.PAYMENT_COMPLETE);
        } else if (response['status'] == "2" &&
            response['payment_method'] == "3") {
          timer.cancel();
          Get.toNamed(Routes.PAYMENT_DECLINE);
        }
      }
    }
  }
}

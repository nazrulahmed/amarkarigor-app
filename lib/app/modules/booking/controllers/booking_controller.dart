import 'dart:convert';

import 'package:amar_karigor/app/global/data/model/booking.dart';
import 'package:amar_karigor/app/global/data/model/user.dart';
import 'package:amar_karigor/app/global/data/providers/book_service_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BookingController extends GetxController {
  final bookServiceProvider = BookServiceProvider();
  List<Booking> incompleteBookings = [];
  List<Booking> completeBookings = [];

  var hasConsumerData = false.obs;

  @override
  void onInit() async {
    super.onInit();

    await getBookings(1);
    await getBookings(2);
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getBookings(int type) async {
    
    http.Response response = await bookServiceProvider.getBookings(type);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == true) {
        final bookingData = data['response'];
        if (type == 1) {
          incompleteBookings.clear();
        } else {
          completeBookings.clear();
        }
        for (int i = 0; i < bookingData.length; i++) {
          var serviceOptions = jsonDecode(bookingData[i]['options']);

          String statusName = '';
          if (bookingData[i]['status'] == '2') {
            statusName = 'Processing';
          } else if (bookingData[i]['status'] == '3') {
            statusName = 'Accepted';
          } else if (bookingData[i]['status'] == '4') {
            statusName = 'Cancelled';
          } else {
            statusName = 'Incomplete';
          }
          Booking booking = Booking(
              id: bookingData[i]['id'],
              serviceId: serviceOptions['service_id'],
              serviceName: serviceOptions['service_name'],
              attribute: serviceOptions['selected_attributes'],
              bookingDate: serviceOptions['booking_date'],
              bookingTime: serviceOptions['booking_time'],
              totalToPay:  serviceOptions['total_price'].toDouble(),
              icon: serviceOptions['service_icon'],
              bookingType: serviceOptions['booking_type'],
              status: statusName);

          if (type == 1)
            incompleteBookings.add(booking);
          else if (type == 2) completeBookings.add(booking);
        }
      }
    }
    update();
    return;
  }

  @override
  void onClose() {}

  Future<User?> consumerInfo(String id) async {
    http.Response response = await bookServiceProvider.consumerInfo(id);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == true) {
        final response = data['response'];
        if (response != null) {
          User consumer = User('', '');

          consumer.setFirstName = response['consumer_name'];
          consumer.setAddress = response['consumer_address'];
          consumer.setPhone = response['consumer_phone'];
          consumer.setEmail = response['consumer_email'];

          return consumer;
        }
      }
    }
    return null;
  }
}

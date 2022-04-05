import 'dart:convert';

import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/data/model/consumer.dart';
import 'package:amar_karigor/app/global/data/model/my_booking_data.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:http/http.dart' as http;
/*
    @author: Nazrul Chowdhury
    @date: 11 February 2022

    |----------------------------------------------------------|
    | Using http library for API calling instead of GetConnect |
    |----------------------------------------------------------|
    
    * GetConnect (get,post) methods are not working properly in Flutter Web.
    * Getting response as null instead of actual response. 
    * Same codebase work well on the Android device.

 */

class BookServiceProvider {
  Future<http.Response> createBooking(List<MyBookingData> bookings,
      double totalToPay, Consumer? consumer) async {
    String url = '${Api.base_url}${Api.create_booking_url}';

    http.Response response = await http.post(Uri.parse(url), headers: {
      "Authorization": LocalData.user!.token
    }, body: {
      "uid": LocalData.user!.uid,
      "total_to_pay": totalToPay.toString(),
      "bookings": jsonEncode(bookings),
      "consumer": consumer == null ? '' : jsonEncode(consumer.toJSON())
    });
    print(response.statusCode);
    print(url);
    print(response.body);
    return response;
  }

  Future<http.Response> updateBookingPaymentStatus(
      int bookingId, int paymentMethod) async {
    String url = '${Api.base_url}${Api.update_booking_payment_status_url}';

    http.Response response = await http.post(Uri.parse(url), headers: {
      "Authorization": LocalData.user!.token
    }, body: {
      "uid": LocalData.user!.uid,
      "booking_id": bookingId.toString(),
      "payment_method": paymentMethod.toString()
    });
    print(response.statusCode);
    print(url);
    print(response.body);
    return response;
  }

  Future<http.Response> getBookings(int status) async {
    String url = '${Api.base_url}${Api.get_booking_url}';

    http.Response response = await http.post(Uri.parse(url), headers: {
      "Authorization": LocalData.user!.token
    }, body: {
      "uid": LocalData.user!.uid,
      "status": status.toString(),
    });
    print(response.statusCode);
    print(url);
    print('-------- RESPONSE ------------ get booking data -------------------------');
    print(response.body);
    print('--------  RESPONSE  ------------ get booking data -------------------------');

    return response;
  }

  Future<http.Response> consumerInfo(String id) async {
    String url = '${Api.base_url}${Api.get_consumer_info_url}';
    http.Response response = await http.post(Uri.parse(url), headers: {
      "Authorization": LocalData.user!.token
    }, body: {
      "uid": LocalData.user!.uid,
      "booking_id": id,
    });
    print(response.statusCode);
    print(url);
    print(response.body);
    return response;
  }
}

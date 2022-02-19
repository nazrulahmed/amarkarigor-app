import 'dart:convert';

import 'package:amar_karigor/app/global/config/api.dart';
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
  Future<http.Response> createBooking(List<MyBookingData> bookings,double totalToPay) async {
    String url = '${Api.base_url}${Api.create_booking_url}';
   

    http.Response response = await http.post(Uri.parse(url),
        headers: {"Authorization": LocalData.user!.token},
        body: {"uid": LocalData.user!.uid,"total_to_pay":totalToPay.toString(), "bookings": jsonEncode(bookings)});
    print(response.statusCode);
    print(url);
    print(response.body);
    return response;
  }

  Future<http.Response> updateBookingPaymentStatus(int bookingId) async {
    String url = '${Api.base_url}${Api.update_booking_payment_status_url}';
   

    http.Response response = await http.post(Uri.parse(url),
        headers: {"Authorization": LocalData.user!.token},
        body: {"uid": LocalData.user!.uid,"booking_id":bookingId.toString()});
    print(response.statusCode);
    print(url);
    print(response.body);
    return response;
  }


}

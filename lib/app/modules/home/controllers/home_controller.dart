import 'dart:convert';

import 'package:amar_karigor/app/global/util/app_pref.dart';
import 'package:amar_karigor/app/modules/home/provider/home_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  AppPref pref = AppPref.instance;
  List tags = ['New', 'Trending', 'Popular', 'Top Services'];
  List offers = [];
  List categories = [
    'Commercial Shifting',
    'Home Shifting',
    'Home Shifting',
    'Home Shifting',
    'Commercial Shifting',
    'Home Shifting',
    'Home Shifting',
    'Home Shifting',
    'Commercial Shifting',
    'Home Shifting',
    'Home Shifting',
    'Home Shifting'
  ];
  List otherServices = ['Cleaning'];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    String token = pref.retriveToken()!;
    String phone = pref.retrivePhoneNumber()!;
    http.Response response = await HomeProvider().homePageData(token, phone);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        final sliderData = data['slider'];
        for (int i = 0; i < sliderData.length; i++) {
          offers.add(sliderData[i]['img']);
        }
      }
    }
    print(offers.length);
    update();
  }

  @override
  void onClose() {}
}

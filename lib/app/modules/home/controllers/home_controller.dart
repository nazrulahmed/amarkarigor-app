import 'dart:convert';

import 'package:amar_karigor/app/global/util/app_pref.dart';
import 'package:amar_karigor/app/modules/home/model/city.dart';
import 'package:amar_karigor/app/modules/home/provider/home_provider.dart';
import 'package:amar_karigor/app/modules/location/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/country.dart';

class HomeController extends GetxController {
  AppPref pref = AppPref.instance;

  List tags = ['New', 'Trending', 'Popular', 'Top Services'];
  List offers = [];
  List categories = [];
  List services = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    String token = pref.retriveToken()??"";
    String phone = pref.retrivePhoneNumber()??"";
    http.Response response = await HomeProvider().homePageData(token, phone);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      if (data['status'] == true) {
        final locationData = data['location'];
        LocationController _locationController = Get.find();
        for (int i = 0; i < locationData.length; i++) {
          final citiesData = locationData[i]['cities'];
          List<City> cities = [];
          for (var city in citiesData) {
            List<String> areas = [];
            for (var area in city['city_area']) {
              areas.add(area['area']);
            }
            City cityObj = City(city['city_name'], areas);
            cities.add(cityObj);
          }
          Country country = Country(locationData[i]['name'], cities);
          _locationController.countries.add(country);
        }
        _locationController.filterCountries.addAll(_locationController.countries);
        
        _locationController.defineLocationType();

        final sliderData = data['slider'];
        for (int i = 0; i < sliderData.length; i++) {
          offers.add(sliderData[i]['img']);
        }
        final categoryData = data['categories'];
        for (int i = 0; i < categoryData.length; i++) {
          categories.add(categoryData[i]['name']);
        }
        final serviceData = data['services'];
        for (int i = 0; i < serviceData.length; i++) {
          services.add(serviceData[i]['name']);
        }
      }
    }
    

    update();
  }

  @override
  void onClose() {}
}

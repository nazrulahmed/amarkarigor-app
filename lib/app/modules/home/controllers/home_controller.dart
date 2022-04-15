import 'dart:convert';
import 'package:amar_karigor/app/global/data/model/provider_info.dart';
import 'package:amar_karigor/app/global/data/model/service.dart';
import 'package:amar_karigor/app/global/data/model/sub_category.dart';
import 'package:amar_karigor/app/global/data/model/user.dart';
import 'package:amar_karigor/app/global/util/app_pref.dart';
import 'package:amar_karigor/app/global/data/model/category.dart';
import 'package:amar_karigor/app/modules/location/model/city.dart';
import 'package:amar_karigor/app/modules/location/model/country.dart';
import 'package:amar_karigor/app/modules/home/provider/home_provider.dart';
import 'package:amar_karigor/app/modules/location/controllers/location_controller.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:amar_karigor/app/global/widget/dummy_document.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/web_document.dart'
    as doc;

class HomeController extends GetxController {
  Future<AppPref?> myPref = AppPref.instance;

  List offers = [];
  List<Category> categories = [];
  List<Service> services = [];
  BuildContext? mContext;
  int selectedCategoryId = 0;

  var currentIndex = 0.obs;

  changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    if (kIsWeb) {
      final loader = doc.document.getElementsByClassName('loading');
      if (loader.isNotEmpty) {
        loader.first.remove();
      }
    }
  }

  @override
  void onReady() async {
    super.onReady();

    if (LocalData.user == null) {
      Get.offAndToNamed(Routes.AUTH);
    }
    http.Response response = await HomeProvider()
        .homePageData(LocalData.user!.uid, LocalData.user!.token);

    print('response status: ${response.statusCode}');

    print('response--------');
    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == true) {
        final providerInfo = data['provider_info'];
        if (providerInfo != null) {
          LocalData.providerInfo = ProviderInfo(providerInfo['phone'],
              providerInfo['whatsapp'], providerInfo['email']);
        }
        final userInfoData = data['user_info'];
        if (userInfoData != null) {
          LocalData.user = User.fromJson(
              LocalData.user!.uid, LocalData.user!.token, userInfoData);
        }

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
        _locationController.filterCountries
            .addAll(_locationController.countries);

        _locationController.defineLocationType();

        final sliderData = data['slider'];
        for (int i = 0; i < sliderData.length; i++) {
          offers.add(sliderData[i]['img']);
        }
        final categoryData = data['categories'];
        for (int i = 0; i < categoryData.length; i++) {
          List<SubCategory> subCategories = [];
          final subCategoryData = categoryData[i]['sub_categories'];

          for (int j = 0; j < subCategoryData.length; j++) {
            SubCategory subCategory = SubCategory(
                int.parse(subCategoryData[j]['id']),
                subCategoryData[j]['name'],
                subCategoryData[j]['attribute']);
            subCategories.add(subCategory);
          }

          Category category = Category(int.parse(categoryData[i]['id']),
              categoryData[i]['name'], categoryData[i]['icon'], subCategories);
          categories.add(category);
        }
        final serviceData = data['services'];

        for (int i = 0; i < serviceData.length; i++) {
          Service service = Service(
            int.parse(serviceData[i]['id']),
            serviceData[i]['name'],
            double.parse(serviceData[i]['start_price']),
            int.parse(serviceData[i]['cat_id']),
            int.parse(serviceData[i]['sub_cat_id']),
            serviceData[i]['icon'],
            serviceData[i]['description'],
            serviceData[i]['attribute'],
            serviceData[i]['option'],
          );
          services.add(service);
        }
      }
    }

    update();
  }

  @override
  void onClose() {}

  List<Service> getServicesByCatId(int id) {
    print('getServicesByCatId...');

    selectedCategoryId = id;
    List<Service> servicesInCategory = [];
    for (Service service in services) {
      print('looping...');
      if (service.catId == id) servicesInCategory.add(service);
    }
    print('return servicesInCategory...');

    return servicesInCategory;
  }

  List<SubCategory> getSubCategoriesByCatId(int id) {
    for (Category category in categories) {
      if (category.id == id) return category.subCategories;
    }
    return <SubCategory>[];
  }

  List<Service> getServicesBySubCatId(int id) {
    List<Service> servicesInSubCategory = [];
    if (id == 0) {
      print('id = $id');
      print('selectedCategoryId $selectedCategoryId');
      servicesInSubCategory = getServicesByCatId(selectedCategoryId);
    } else {
      for (Service service in services) {
        if (service.subCatId == id) servicesInSubCategory.add(service);
      }
    }

    return servicesInSubCategory;
  }
}

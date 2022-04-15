import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
class Offers extends StatelessWidget {
  final HomeController homeController = Get.find();
  
  @override
  Widget build(BuildContext context) {
      return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20, left: 16),
      height: 150,
      child: homeController.offers.length == 0
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return CustomShimmer().getShimmerFromColor(
                    height: 150,
                    width: 350,
                    radius: 20,
                    margin: EdgeInsets.only(right: 8));
              })
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeController.offers.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(right: 16),
                    child: kIsWeb
                        ? ci.CustomImage(
                            "offer$index",
                            '${Api.assets_url}${Api.banners}${homeController.offers[index]}',
                            350,
                            150)
                        : FadeInImage(
                            image: NetworkImage(
                                '${Api.assets_url}${Api.banners}${homeController.offers[index]}'),
                            placeholder: AssetImage(
                                'assets/images/placeholder_image.png'),
                            fit: BoxFit.cover,
                            width: 300,
                          ));
              }));

  }
}

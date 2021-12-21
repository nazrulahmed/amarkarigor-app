import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

Widget getOffers(List offers) {
  return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20, left: 16),
      height: 150,
      child: offers.length == 0
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
              itemCount: offers.length,
              itemBuilder: (context, index) {
                print('I am inside itemBuilder with length  ${offers.length}');
                return Container(
                    margin: EdgeInsets.only(right: 16),
                    child: kIsWeb
                        ? ci.CustomImage(
                            "offer$index",
                            '${Api.assets_url}${Api.banners}${offers[index]}',
                            350,
                            150)
                        : FadeInImage(
                            image: NetworkImage(
                                '${Api.assets_url}${Api.banners}${offers[index]}'),
                            placeholder: AssetImage(
                                'assets/images/placeholder_image.png'),
                            fit: BoxFit.cover,
                            width: 300,
                          ));
              }));
}

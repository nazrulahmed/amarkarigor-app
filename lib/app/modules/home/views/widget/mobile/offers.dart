import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
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
                return CustomShimmer().getShimmerFromColor(height: 150, width: 350, radius: 20,margin:EdgeInsets.only(right:8));
              })
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Image.network(
                    '${Api.assets_url}${Api.banners}${offers[index]}',
                    fit: BoxFit.fill,
                  ),
                );
              }));
}

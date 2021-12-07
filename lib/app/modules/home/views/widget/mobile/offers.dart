import 'package:amar_karigor/app/global/widget/shimmer.dart';
import 'package:flutter/material.dart';

Widget getOffers(List offers) {
  print('getOffer() with length ${offers.length}');
  return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20, left: 16),
      height: 150,
      child: offers.length == 0
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return get_shimmer(height: 150, width: 350, radius: 20);
              })
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Image.network(
                    "https://imgur.com/zGKqKWe.png",
                    fit: BoxFit.fill,
                  ),
                );
              }));
}

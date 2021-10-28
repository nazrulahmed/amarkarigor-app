import 'package:flutter/material.dart';

Widget getOffers(List offers, BoxConstraints constraints) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
      height: constraints.maxHeight * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return Image.network(
              "https://imgur.com/zGKqKWe.png",
              fit: BoxFit.fill,
            );
          }));
}

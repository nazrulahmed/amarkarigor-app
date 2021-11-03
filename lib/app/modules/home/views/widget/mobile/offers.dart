import 'package:flutter/material.dart';

Widget getOffers(List offers, BoxConstraints constraints) {
  return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20,left:16),
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return Container(
              margin:EdgeInsets.only(right:16),
              child: Image.network(
                "https://imgur.com/zGKqKWe.png",
                fit: BoxFit.fill,
              ),
            );
          }));
}

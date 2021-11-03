import '../../home/controllers/home_controller.dart';
import 'widget/mobile/imports.dart';
import 'package:flutter/material.dart';

Widget getMobileView(HomeController controller, BoxConstraints constraints) {
  return ListView(
    children: [
     
      SizedBox(
        height: 20,
      ),
      getOffers(controller.offers, constraints),
      getCategories(controller.categories, constraints),
      getServices(controller.categories, constraints),
    ],
  );
}

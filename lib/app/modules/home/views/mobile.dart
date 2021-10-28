import '../../home/controllers/home_controller.dart';
import 'widget/mobile/imports.dart';
import 'package:flutter/material.dart';

Widget getMobileView(HomeController controller,BoxConstraints constraints) {
  return ListView(
    children: [
     
      getTags(controller.tags,constraints),
      getOffers(controller.offers,constraints),
      getCategories(controller.categories,constraints),
      getServices(controller.categories,constraints),
    ],
  );
}

import '../../home/controllers/home_controller.dart';
import 'widget/mobile/imports.dart';
import 'package:flutter/material.dart';

Widget getDesktopView(HomeController controller) {
  return ListView(
    children: [
      getHomeAppBar(),
      
    ],
  );
}
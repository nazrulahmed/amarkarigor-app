import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/global/config/app_color.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Amar Karigor",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: colorPrimary,
      ),
    ),
  );
}

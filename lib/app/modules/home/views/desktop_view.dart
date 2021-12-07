import 'package:amar_karigor/app/modules/home/views/mobile_view.dart';

import '../../home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

Scaffold desktopView(HomeController controller) {
  return Scaffold(
    body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return SizedBox();
        } else {
          return mobileView(controller);
        }
      },
    ),
  );
}

import 'package:amar_karigor/app/modules/home/views/mobile_view.dart';
import 'package:amar_karigor/app/modules/home/views/widget/desktop/desktop_main.dart';

import '../../home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

Scaffold desktopView(HomeController controller) {
  return Scaffold(
    body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return DesktopMainView();
        } else {
          return mobileView(controller);
        }
      },
    ),
  );
}

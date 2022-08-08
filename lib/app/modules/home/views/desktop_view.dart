import 'package:amar_karigor/app/global/util/platform_helper.dart';
import 'package:amar_karigor/app/modules/home/views/mobile_view.dart';
import 'package:amar_karigor/app/modules/home/views/widget/desktop/desktop_main.dart';
import 'package:flutter/material.dart';

import '../../home/controllers/home_controller.dart';

Scaffold desktopView(HomeController controller) {
  return Scaffold(
    body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= desktopWindowIdealSize) {
          return DesktopMainView();
        } else {
          return mobileView(controller);
        }
      },
    ),
  );
}

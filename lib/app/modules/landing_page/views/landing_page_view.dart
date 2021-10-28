import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import '../../../global/config/constant.dart';
import '../../../global/widget/bottom_nav.dart';
import '../../auth/views/auth_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/landing_page_controller.dart';

class LandingPageView extends GetView<LandingPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (controller.currentIndex == HOME_INDEX)
            return HomeView();
          else
            return AuthView();
        }),
      ),
      bottomNavigationBar: kIsWeb?SizedBox():getBottomNavbar(controller),
    );
  }
}

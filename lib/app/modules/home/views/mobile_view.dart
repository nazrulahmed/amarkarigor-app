import 'package:amar_karigor/app/global/widget/bottom_nav.dart';
import 'package:amar_karigor/app/modules/booking/views/booking_view.dart';
import 'package:amar_karigor/app/modules/home/views/homepage.dart';
import 'package:amar_karigor/app/modules/more/views/more_view.dart';
import 'package:amar_karigor/app/modules/support/views/support_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [HomePage(), SupportView(), BookingView(),MoreView()];
Scaffold mobileView(HomeController controller) {
  return Scaffold(
    body: Obx(() => pages[controller.currentIndex.value]),
    bottomNavigationBar: getBottomNavbar(controller),
  );
}

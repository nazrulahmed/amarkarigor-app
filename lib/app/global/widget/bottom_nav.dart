import 'package:amarkarigor/app/global/config/app_style.dart';
import 'package:amarkarigor/app/modules/landing_page/controllers/landing_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

Widget getBottomNavbar(LandingPageController controller) {
  return Obx(() {
    return Container(
      color: Colors.green[50],
      child: SalomonBottomBar(
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.changePage(index);
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: MyColors.colorPrimary,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: MyColors.colorPrimary,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: MyColors.colorPrimary,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: MyColors.colorPrimary,
          ),
        ],
      ),
    );
  });
}

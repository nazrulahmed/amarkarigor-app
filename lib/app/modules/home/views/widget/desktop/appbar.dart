import 'package:amar_karigor/app/global/util/platform_helper.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_item.dart' as myMenuItem;

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > desktopWindowIdealSize
          ? desktopWindowIdealSize
          : MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/ak_horizontal.png",
            height: 50,
            alignment: Alignment.topCenter,
          ),
          Spacer(),
          myMenuItem.MenuItem(
            title: "Home",
            press: () {
              Get.toNamed(Routes.HOME);
            },
          ),
          myMenuItem.MenuItem(
            title: "Bookings",
            press: () {
              Get.toNamed(Routes.BOOKING);
            },
          ),
          myMenuItem.MenuItem(
            title: "Support",
            press: () {
              Get.toNamed(Routes.SUPPORT);
            },
          ),
          myMenuItem.MenuItem(
            title: "More",
            press: () {
              Get.toNamed(Routes.MORE);
            },
          ),
        ],
      ),
    );
  }
}

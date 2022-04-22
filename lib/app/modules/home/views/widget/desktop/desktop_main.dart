import 'package:amar_karigor/app/modules/home/views/widget/desktop/appbar.dart';
import 'package:amar_karigor/app/modules/home/views/widget/desktop/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class DesktopMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width  of our screen
    return Scaffold(
      body:  GetBuilder(builder: (HomeController controller)=> ListView(
        children: <Widget>[
          CustomAppBar(),
          Body(),
        ],
      ),
    ));
  }
}
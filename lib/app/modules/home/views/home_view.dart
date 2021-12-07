import 'package:amar_karigor/app/modules/home/views/desktop_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'mobile_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb?desktopView(controller):mobileView(controller);
  }
}

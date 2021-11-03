import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../home/views/mobile.dart';
import 'widget/mobile/appbar.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:
         MyAppbar()
     
         ,drawer: Drawer(
          child: ListView(
            children: [Text('hi')],
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constrains) {
            return kIsWeb
                ? getMobileView(controller, constrains)
                : getMobileView(controller, constrains);
          }),
        ));
  }
}

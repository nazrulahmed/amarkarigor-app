import 'package:get/get_state_manager/get_state_manager.dart';
import '../../home/controllers/home_controller.dart';
import 'widget/mobile/imports.dart';
import 'package:flutter/material.dart';

Scaffold mobileView(HomeController controller) {
  return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [Text('hi')],
      )),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            appBar(),
          ];
        },
        body: GetBuilder(builder: (HomeController controller) {
          return ListView(
            children: [
              getOffers(controller.offers),
              getCategories(controller.categories),
              getServices(controller.services,controller.mContext)
            ],
          );
        }),
      ));
}
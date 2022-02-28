import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../home/controllers/home_controller.dart';
import 'widget/mobile/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
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
            getServices(controller.services, controller.mContext)
          ],
        );
      }),
    );
  }
}

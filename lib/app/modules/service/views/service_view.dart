import 'package:amar_karigor/app/modules/service/views/widgets/service_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/util/platform_helper.dart';
import '../controllers/service_controller.dart';
import 'widgets/service_bottom.dart';
import 'widgets/service_datetime.dart';
import 'widgets/service_header.dart';

class ServiceView extends GetView<ServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(builder: (ServiceController sController) {
        return ListView(children: [
          Center(
            child: Container(
              width: isDesktopView(context)
                  ? MediaQuery.of(context).size.width * .6
                  : double.infinity,
              child: Column(
                children: [
                  serviceHeader(controller, context),
                  controller.servicePage.value == ServicePages.SERVICE_TIME
                      ? serviceDateTime(controller)
                      : serviceOption(controller),
                  isDesktopView(context)
                      ? serviceBottom(controller)
                      : SizedBox()
                ],
              ),
            ),
          )
        ]);
      }),
      bottomNavigationBar:
          isDesktopView(context) ? SizedBox() : serviceBottom(controller),
    );
  }
}

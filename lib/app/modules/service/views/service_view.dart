import 'package:amar_karigor/app/modules/service/views/widgets/service_option.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/service_controller.dart';
import 'widgets/service_bottom.dart';
import 'widgets/service_datetime.dart';
import 'widgets/service_header.dart';

class ServiceView extends GetView<ServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(builder: (ServiceController controller) {
        return ListView(children: [
          serviceHeader(controller),
          controller.servicePage.value == ServicePages.SERVICE_TIME?
         serviceDateTime(controller): 
          serviceOption(controller),
        ]);
      }),
      bottomNavigationBar: serviceBottom(controller),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';
import 'package:amar_karigor/app/modules/notifications/widgets/notification_item.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Obx(
          ()=>controller.isNotificationLoading.value?
              Center(child: CircularProgressIndicator(),):
              Container(
                child: ListView.builder(
                    itemCount: controller.notificationList.length,
                    itemBuilder: (context,index){
                      return NotificationItem(controller.notificationList[index]);
                    }),
              )
      )
    );
  }
}

import 'dart:convert';

import 'package:amar_karigor/app/modules/notifications/controllers/provider/notification_provider.dart';
import 'package:amar_karigor/app/modules/notifications/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  RxBool isNotificationLoading = true.obs;
  List<NotificationModel> notificationList = [];

  @override
  void onInit() async {
    super.onInit();
    isNotificationLoading(true);
    http.Response response = await NotificationsProvider().notifications();
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        final notifications = data['notifications'];
        for (int i = 0; i < notifications.length; i++) {
          NotificationModel notificationModel =
              NotificationModel.fromJSON(notifications[i]);
          notificationList.add(notificationModel);
          isNotificationLoading(false);
        }
      } else {
        isNotificationLoading(false);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

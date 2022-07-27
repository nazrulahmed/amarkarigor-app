import 'package:amar_karigor/app/modules/notifications/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  NotificationItem(this._notificationModel);
  final NotificationModel _notificationModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(_notificationModel.title)
        ],
      ),
    );
  }
}

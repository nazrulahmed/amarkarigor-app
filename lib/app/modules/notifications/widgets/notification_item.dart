import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/modules/notifications/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  NotificationItem(this._notificationModel);
  final NotificationModel _notificationModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _notificationModel.image == ''
                ? Icon(
                    Icons.notifications,
                    color: Colors.green,
                    size: 32,
                  )
                : Image.network(_notificationModel.image),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _notificationModel.title,
                  style: MyTextStyle.textBlackLargeBold,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  _notificationModel.title,
                  style: MyTextStyle.textBlackSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

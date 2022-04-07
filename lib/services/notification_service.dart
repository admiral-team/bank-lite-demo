import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  // static Future _notificationDetails() async {
  //   return const NotificationDetails(
  //     android: AndroidNotificationDetails('channel id', 'channel name',
  //         importance: Importance.max),
  //     iOS: IOSNotificationDetails(presentAlert: true, presentBadge: true),
  //   );
  // }

  // static Future showNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? playload,
  // }) async =>
  //     _notifications.show(
  //       id,
  //       title,
  //       body,
  //       await _notificationDetails(),
  //       payload: playload,
  //     );
}

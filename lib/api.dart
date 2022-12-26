import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi{
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future init({bool scheduled = false}) async {
    var initAndroidSettings =
    AndroidInitializationSettings('mipmap/launcher_icon');
    var ios = IOSInitializationSettings();
    final settings =
    InitializationSettings(android: initAndroidSettings, iOS: ios);
    await _notification.initialize(settings);
  }

  static Future showNotification({
    var id = 0,
    var title,
    var body,
    var payload,
  }) async =>
      _notification.show(id, title, body, await notificationDetails());

  static Future notificationDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

}
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ScheduleNotificationn  {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();


  final AndroidInitializationSettings _androidInitializationSettings = AndroidInitializationSettings('launcher_icon');

  void initialiseNotifications() async{
    InitializationSettings initializationSettings =InitializationSettings(android:_androidInitializationSettings,);

    await _flutterLocalNotificationPlugin.initialize(initializationSettings);
  }
  void sendNotifications (String titel , String body) async{
    AndroidNotificationDetails androidNotificationDetails =const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance:Importance.Max,
      priority: Priority.High,
    );

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationPlugin.show(0, titel, body, notificationDetails);
  }
}
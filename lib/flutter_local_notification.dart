import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse notificationResponse) {
    // log(notificationResponse.id!.toString());
    // log(notificationResponse.payload!.toString());
    // Navigator.push(context, route);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //basic Notification
  static int notificationId = 0;
  static void showBasicNotification() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
        'id_1', 'Basic Notification',
        importance: Importance.max, priority: Priority.max, playSound: true);
    NotificationDetails details = NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(
      notificationId++, // Increment the ID each time
      'Basic Notification',
      'This is the notification body.',
      details,
    );
  }

  void cancelNotificatiom(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  // repating Notification
  static void showRepeatedNotifiation() async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      'id 3',
      'basic notification1',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      4,
      'Basic Notification',
      'body',
      RepeatInterval.everyMinute,
      details,
    );
  }
}

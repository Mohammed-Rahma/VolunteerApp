import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
//1
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationService =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  void initialiseNotifications() async {
    //3
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
    );

    //4
    await _flutterLocalNotificationService.initialize(
      initializationSettings,
    );
  }

  void sendNotifications(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            priority: Priority.high, importance: Importance.max);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationService.show(
        0, title, body, notificationDetails);
  }

  // //5
  // Future<NotificationDetails> _notificationDetails() async {
  //   const AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails('channel_id', 'channel_name',
  //           channelDescription: 'description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           playSound: true);
  //
  //   return const NotificationDetails(
  //     android: androidNotificationDetails,
  //   );
  // }
  //
  // Future<void> showScheduledNotification({
  //   required int id,
  //   required String title,
  //   required String body,
  //   // required int seconds
  // }) async {
  //   final details = await _notificationDetails();
  //   await _localNotificationService.periodicallyShow(
  //       id, title, body, RepeatInterval.everyMinute, details);
  // }
}

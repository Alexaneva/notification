import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void showDailyNotification(
    BuildContext context,
    String s, {
    required int id,
    required String name,
    required String body,
    required String channelDescription,
  }) async {
    final details = await notificationDetails();
    var localNotificationService;
    await localNotificationService.periodicallyShow(
        1,
        'Daily notification',
        'Do not forget about 30 min for programming',
        RepeatInterval.daily,
        details,
        androidAllowWhileIdle: true);
  }

  Future<NotificationDetails> notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('id', 'name',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true,
            sound: RawResourceAndroidNotificationSound('sound'),
            icon: '@drawable/ic_launcher',
            largeIcon: DrawableResourceAndroidBitmap('@drawable/ic_launcher'));
    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(presentSound: true, sound: 'sound');
    return const NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
  }
}

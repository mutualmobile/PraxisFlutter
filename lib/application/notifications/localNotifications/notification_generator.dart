import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:praxis_flutter/application/notifications/localNotifications/android_notification_details_mapper.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'local_notification_helper.dart';

var androidDetails =
    AndroidNotificationDetailsMapper().getAndroidNotificationDetails();
var iOSDetails = const IOSNotificationDetails();

Future<void> showSimpleNotification() async {
  var platformDetails =
      NotificationDetails(android: androidDetails, iOS: iOSDetails);
  await flutterLocalNotificationsPlugin.show(0, 'Flutter Local Notification',
      'Flutter Simple Notification', platformDetails,
      payload: 'Destination Screen (Simple Notification)');
}

/// Schedule notification after certain amount of time
Future<void> showScheduleNotification() async {
  tz.initializeTimeZones();
  var scheduledNotificationDateTime =
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));
  var androidDetails = AndroidNotificationDetailsMapper()
      .getAndroidNotificationDetails(
          icon: '@drawable/ic_flutter',
          largeIcon: const DrawableResourceAndroidBitmap(
              '@drawable/big_notification'));
  final platformDetails =
      NotificationDetails(android: androidDetails, iOS: iOSDetails);
  await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      "Flutter Local Notification",
      "Flutter Schedule Notification",
      scheduledNotificationDateTime,
      platformDetails,
      payload: 'Destination Screen (Simple Notification)',
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);
}

/// Schedule notification after certain amount of time periodically using periodicallyShow method.
Future<void> showPeriodicNotification() async {
  final platformDetails = NotificationDetails(android: androidDetails);
  await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      "Flutter Local Notification",
      "Flutter Periodic Notification",
      RepeatInterval.everyMinute,
      platformDetails,
      payload: 'Destination Screen (Simple Notification)');
}

/// Display only picture notification in android platform as below.
Future<void> showBigPictureNotification() async {
  var bigPictureStyleInformation = const BigPictureStyleInformation(
    DrawableResourceAndroidBitmap('@drawable/big_notification'),
    largeIcon: DrawableResourceAndroidBitmap('@drawable/big_notification'),
    contentTitle: "Flutter Big Picture Notification Title",
    summaryText: "Flutter Big Picture Notification Summary Text",
  );
  var androidDetails = AndroidNotificationDetailsMapper()
      .getAndroidNotificationDetails(
          styleInformation: bigPictureStyleInformation);
  final platformDetails = NotificationDetails(android: androidDetails);
  await flutterLocalNotificationsPlugin.show(0, "Flutter Local Notification",
      "Flutter Big Picture Notification", platformDetails,
      payload: 'Destination Screen (Simple Notification)');
}

/// multiple text lines notification.
Future<void> showBigTextNotification() async {
  const bigTextStyleInformation = BigTextStyleInformation(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    htmlFormatBigText: true,
    contentTitle: 'Flutter Big Text Notification Title',
    htmlFormatContentTitle: true,
    summaryText: 'Flutter Big Text Notification Summary Text',
    htmlFormatSummaryText: true,
  );
  var androidDetails = AndroidNotificationDetailsMapper()
      .getAndroidNotificationDetails(styleInformation: bigTextStyleInformation);
  final platformDetails = NotificationDetails(android: androidDetails);
  await flutterLocalNotificationsPlugin.show(0, 'Flutter Local Notification',
      'Flutter Big Text Notification', platformDetails,
      payload: 'Destination Screen(Big Text Notification)');
}

/// trigger notification continuously.
Future<void> showInsistentNotification() async {
  const int insistentFlag = 4;

  var androidDetails = AndroidNotificationDetailsMapper()
      .getAndroidNotificationDetails(
          ticker: 'ticker',
          additionalFlags: Int32List.fromList(<int>[insistentFlag]));
  final platformDetails = NotificationDetails(android: androidDetails);
  await flutterLocalNotificationsPlugin.show(0, 'Flutter Local Notification',
      'Flutter Insistent Notification', platformDetails,
      payload: 'Destination Screen(Insistent Notification)');
}

/// Ongoing notification is used to notify user that task is running like foreground service. This type of notification you can not be clear.
Future<void> showOngoingNotification() async {
  final androidDetails = AndroidNotificationDetailsMapper()
      .getAndroidNotificationDetails(ongoing: true, autoCancel: false);
  var platformDetails = NotificationDetails(android: androidDetails);
  await flutterLocalNotificationsPlugin.show(0, 'Flutter Local Notification',
      'Flutter Ongoing Notification', platformDetails,
      payload: 'Destination Screen(Ongoing Notification)');
}

/// display progress of particular task.
Future<void> showProgressNotification() async {
  const int maxProgress = 5;
  for (int progress = 0; progress <= maxProgress; progress++) {
    await Future<void>.delayed(const Duration(seconds: 1), () async {
      final androidDetails = AndroidNotificationDetailsMapper()
          .getAndroidNotificationDetails(
              channelShowBadge: false,
              importance: Importance.max,
              priority: Priority.high,
              onlyAlertOnce: true,
              showProgress: true,
              maxProgress: maxProgress,
              progress: progress);
      var platformDetails = NotificationDetails(android: androidDetails);
      await flutterLocalNotificationsPlugin.show(
          0,
          'Flutter Local Notification',
          'Flutter Progress Notification',
          platformDetails,
          payload: 'Destination Screen(Progress Notification)');
    });
  }
}

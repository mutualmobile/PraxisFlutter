
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void initialiseLocalNotifications() {
  requestPermissions();
  var androidSettings = const AndroidInitializationSettings('ic_flutter');
  var iOSSettings = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false
  );
  initialiseLocalNotificationsPlugin(androidSettings, iOSSettings);
}

void initialiseLocalNotificationsPlugin(androidSettings, iOSSettings) {
  var initSettings = InitializationSettings(android: androidSettings, iOS: iOSSettings);
  flutterLocalNotificationsPlugin.initialize(initSettings);
}

void requestPermissions() {
  FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
      alert: true,
      sound: true,
      badge: true
  );
}
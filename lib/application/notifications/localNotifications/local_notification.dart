import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:praxis_flutter/application/widgets/platform_scaffold.dart';

class LocalNotifications extends StatefulWidget {
  const LocalNotifications({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocalNotificationsState();
}

class _LocalNotificationsState extends State<LocalNotifications> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    requestPermissions();
    var androidSettings = const AndroidInitializationSettings('@mipmap/app_icon');
    var iOSSettings = const IOSInitializationSettings(
        requestAlertPermission: false,
        requestSoundPermission: false,
        requestBadgePermission: false
    );

    var initSettings = InitializationSettings(
        android: androidSettings, iOS: iOSSettings);
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

  // Future onClickNotification(String payload) => Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     return DestinationScreen(
  //       payload: payload,
  //     );
  //   }));

  Future<void> showSimpleNotification() async {
    var androidDetails = const AndroidNotificationDetails(
        'channelId',
        'channelName',
        channelDescription: 'description',
        priority: Priority.high,
        importance: Importance.max);
    var iOSDetails = const IOSNotificationDetails();
    var platformDetails = NotificationDetails(
        android: androidDetails, iOS: iOSDetails);
    await flutterLocalNotificationsPlugin.show(
        0,
        'Flutter Local Notification',
        'Flutter Simple Notification',
        platformDetails, payload: 'Destination Screen (Simple Notification)'
    );
  }

  @override
  Widget build(BuildContext context) {
   return PraxisScaffold(
       androidAppBar: AppBar(
         title: appBarTitle(),
       ),
       iosNavBar: CupertinoNavigationBar(
         middle: appBarTitle(),
       ),
       body: Center(
         child: RaisedButton(
           onPressed: () => {showSimpleNotification()},
           child: const Text('Simple Notification'),
         ),
       )
   );
  }

  Text appBarTitle() => const Text("Local Notifications");
}
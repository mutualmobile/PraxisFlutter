import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praxis_flutter/application/widgets/platform_scaffold.dart';

import 'notification_generator.dart';

class LocalNotifications extends StatelessWidget {
  const LocalNotifications({Key? key}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Simple Notification'),
                onPressed: () => showSimpleNotification(),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: const Text('Schedule Notification'),
                onPressed: () => showScheduleNotification(),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: const Text('Periodic Notification'),
                onPressed: () => showPeriodicNotification(),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: const Text('Big Picture Notification'),
                onPressed: () => showBigPictureNotification(),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: const Text('Big Text Notification'),
                onPressed: () => showBigTextNotification(),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: const Text('Insistent Notification'),
                onPressed: () => showInsistentNotification(),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: const Text('OnGoing Notification'),
                onPressed: () => showOngoingNotification(),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: const Text('Progress Notification'),
                onPressed: () => showProgressNotification(),
              ),
            ],
          ),
        ));
  }

  Text appBarTitle() => const Text("Local Notifications");
}
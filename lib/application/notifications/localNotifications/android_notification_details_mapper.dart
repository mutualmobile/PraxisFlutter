import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AndroidNotificationDetailsMapper {
  AndroidNotificationDetails getAndroidNotificationDetails(
      {String channelId = 'channelId',
      String channelName = 'channelName',
      String description = 'description',
      Priority priority = Priority.high,
      Importance importance = Importance.max,
      String? icon,
      AndroidBitmap<Object>? largeIcon,
      StyleInformation? styleInformation,
      String? ticker,
      Int32List? additionalFlags,
      bool ongoing = false,
      bool autoCancel = true,
      bool channelShowBadge = true,
      bool onlyAlertOnce = false,
      bool showProgress = false,
      int maxProgress = 0,
      int progress = 0}) {
    return AndroidNotificationDetails(
        channelId = channelId, channelName = channelName,
        channelDescription: description,
        priority: priority,
        importance: importance,
        icon: icon,
        largeIcon: largeIcon,
        styleInformation: styleInformation,
        ticker: ticker,
        additionalFlags: additionalFlags,
        ongoing: ongoing,
        autoCancel: autoCancel,
        channelShowBadge: channelShowBadge,
        onlyAlertOnce: onlyAlertOnce,
        showProgress: showProgress,
        maxProgress: maxProgress,
        progress: progress);
  }
}

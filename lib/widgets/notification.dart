
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

///  *********************************************
///     NOTIFICATION CONTROLLER
///  *********************************************
///
class NotificationController {
  static ReceivedAction? initialAction;

  ///  *********************************************
  ///     INITIALIZATIONS
  ///  *********************************************
  ///
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        'resource://drawable/res_logo',
        [
 NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/en',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'en',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/en',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'nosound',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: false,
              soundSource: 'resource://raw/en',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'novibration',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/en',
              enableVibration: false,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'ta',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/ta',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'ja',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/jp',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'zh',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/zh',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'de',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/de',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'fi',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/fi',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'fr',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/fr',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'it',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/it',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'ms',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/ms',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'pt',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/pt',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),  NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/en',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'en',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/en',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'nosound',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: false,
              soundSource: 'resource://raw/en',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'novibration',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/en',
              enableVibration: false,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'ta',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/ta',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'jp',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/jp',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'zh',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/zh',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'de',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/de',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'fi',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/fi',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'fr',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/fr',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'it',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/it',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'ms',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/ms',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
          NotificationChannel(
              channelKey: 'pt',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              soundSource: 'resource://raw/pt',
              enableVibration: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.Max,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepOrange,
              ledColor: Colors.deepOrange),
        ],
        debug: true);

    // Get initial notification action is optional
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS LISTENER
  ///  *********************************************
  ///  Notifications events are only delivered after call this method
  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS
  ///  *********************************************
  ///
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      // For background actions, you must hold the execution until the end
      print(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
      await executeLongTaskInBackground();
    } else {
      MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/notification-page',
          (route) =>
              (route.settings.name != '/notification-page') || route.isFirst,
          arguments: receivedAction);
    }
  }

  ///  *********************************************
  ///     REQUESTING NOTIFICATION PERMISSIONS
  ///  *********************************************
  ///
  static Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;
    BuildContext context = MyApp.navigatorKey.currentContext!;
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Get Notified!',
                style: Theme.of(context).textTheme.titleLarge),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/animated-bell.gif',
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                    'Allow Awesome Notifications to send you beautiful notifications!'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Deny',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () async {
                    userAuthorized = true;
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Allow',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.deepPurple),
                  )),
            ],
          );
        });
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  ///  *********************************************
  ///     BACKGROUND TASKS TEST
  ///  *********************************************
  static Future<void> executeLongTaskInBackground() async {
    print("starting long task");
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse("http://google.com");
    final re = await http.get(url);
    print(re.body);
    print("long task done");
  }

  ///  *********************************************
  ///     NOTIFICATION CREATION METHODS
  ///  *********************************************
  ///
  static Future<void> createNewNotification(String channel) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1, // -1 is replaced by a random number
          channelKey: channel,
          title: 'Medimind',
          body: 'notificationBody'.tr(),
          bigPicture: 'asset://assets/images/take_medicine.png',
          largeIcon: 'asset://assets/images/hclogo.png',
          //'asset://assets/images/balloons-in-sky.jpg',
          notificationLayout: NotificationLayout.BigPicture,
          //hideLargeIconOnExpand: true,
          roundedLargeIcon: true,
          payload: {'notificationId': '1234567890'}),
          
      /*actionButtons: [
          NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
          NotificationActionButton(
              key: 'REPLY',
              label: 'Reply Message',
              requireInputText: true,
              actionType: ActionType.SilentAction
          ),
          NotificationActionButton(
              key: 'DISMISS',
              label: 'Dismiss',
              actionType: ActionType.DismissAction,
              isDangerousOption: true)
        ]*/
    );
  }

  static Future<void> scheduleNewNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: -1, // -1 is replaced by a random number
            channelKey: 'alerts',
            title: "Huston! The eagle has landed!",
            body:
                "A small step for a man, but a giant leap to Flutter's community!",
            bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
            largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
            //'asset://assets/images/balloons-in-sky.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {
              'notificationId': '1234567890'
            }),
        actionButtons: [
          NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
          NotificationActionButton(
              key: 'DISMISS',
              label: 'Dismiss',
              actionType: ActionType.DismissAction,
              isDangerousOption: true)
        ],
        schedule: NotificationCalendar.fromDate(
            date: DateTime.now().add(const Duration(seconds: 10))));
  }

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}

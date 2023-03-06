// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class NotificationsService {
//   NotificationsService._();
//
//   static final NotificationsService _instance = NotificationsService._();
//
//   static NotificationsService get getInstance => _instance;
//
//   static Future<void> initialize() async {
//     await Firebase.initializeApp();
//     await FirebaseMessaging.instance.requestPermission(
//       announcement: true,
//       provisional: true,
//       alert: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       sound: true,
//     );
//
//     await FirebaseMessaging.instance.setAutoInitEnabled(true);
//
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: false,
//       badge: false,
//       sound: false,
//     );
//
//     FirebaseMessaging.onMessage.listen((remoteMessage) async {
//       // final isNews = remoteMessage.data[Constants.page] == Constants.news;
//
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) async {
//       // final isNews = remoteMessage.data[Constants.page] == Constants.news;
//
//     });
//
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   }
// }
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage remoteMessage) async {
//
// }

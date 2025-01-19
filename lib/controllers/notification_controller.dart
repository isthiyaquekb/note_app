
import 'package:get/get.dart';

class NotificationController extends GetxController {
  // final storageBox = GetStorage();
  //
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  //
  // @override
  // void onInit() {
  //   // TODO: REQUEST PERMISSION
  //   // TODO: GET TOKEN
  //   // TODO: GET INITIAL INFORMATION
  //   super.onInit();
  //   requestPermission();
  //   initialConfig();
  // }
  //
  // void requestPermission() async {
  //   NotificationSettings notificationSettings = await FirebaseMessaging.instance
  //       .requestPermission(
  //           alert: true,
  //           announcement: true,
  //           badge: true,
  //           carPlay: false,
  //           criticalAlert: false,
  //           provisional: false,
  //           sound: true);
  //
  //   if (notificationSettings.authorizationStatus ==
  //       AuthorizationStatus.authorized) {
  //     log("PERMISSION GRANTED");
  //
  //   } else if (notificationSettings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     log("USER GRANTED PROVISIONAL PERMISSION");
  //   } else {
  //     log("USER PERMISSION DECLINED");
  //   }
  // }
  //
  // void getFCMToken() async {
  //   // For apple platforms, ensure the Device token is available before making any FCM plugin API calls
  //   final token = await FirebaseMessaging.instance.getToken();
  //   if (token != null) {
  //     // Device token is available, make FCM plugin API requests...
  //     log("TOKEN==>$token");
  //     storageBox.write(AppKeys.keyFCMToken, token);
  //   }
  // }
  //
  // void initialConfig() {
  //   var androidInitialize =
  //       const AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var iosInitialize = const DarwinInitializationSettings();
  //
  //   var initializationSettings =
  //       InitializationSettings(android: androidInitialize, iOS: iosInitialize);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onDidReceiveBackgroundNotificationResponse: (backgroundResp) {
  //     print("##XBACKGROUN NOTIFICATION:${backgroundResp.payload}");
  //   }, onDidReceiveNotificationResponse: (response) {
  //     print("## NOTIFICATION:${response.payload}");
  //   });
  //
  //   FirebaseMessaging.onMessage.listen((event) async {
  //     print("XXXX LISTENING====>TO MESSAGE XXXX");
  //     print("XXXX MESSAGE TITLE XXXX ${event.notification!.title}");
  //     print("XXXX MESSAGE BODY XXXX ${event.notification!.body}");
  //
  //     var bigTextStyle=BigTextStyleInformation(event.notification!.body.toString(),contentTitle: event.notification!.title,htmlFormatBigText: true,htmlFormatContentTitle: true);
  //     final androidSpecific=AndroidNotificationDetails("testNoteChannel","testNoteChannel",importance: Importance.high,styleInformation: bigTextStyle,priority: Priority.high,playSound: true,);
  //     final notificationDetails=NotificationDetails(android: androidSpecific,);
  //     await flutterLocalNotificationsPlugin.show(0, event.notification!.title,  event.notification!.body, notificationDetails,payload: event.data['title']);
  //   });
  // }
}

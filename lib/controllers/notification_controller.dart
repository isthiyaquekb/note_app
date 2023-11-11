import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{


  @override
  void onInit() {
    // TODO: REQUEST PERMISSION
    // TODO: GET TOKEN
    // TODO: GET INITIAL INFORMATION
    super.onInit();
    requestPermission();
    getFCMToken();
  }

  void requestPermission() async {
    NotificationSettings notificationSettings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
      sound: true
    );

    if(notificationSettings.authorizationStatus==AuthorizationStatus.authorized){
      log("PERMISSION GRANTED");
    }else if(notificationSettings.authorizationStatus==AuthorizationStatus.provisional){
      log("USER GRANTED PROVISIONAL PERMISSION");
    }else{
      log("USER PERMISSION DECLINED");
    }
  }

  void getFCMToken() async {

    // For apple platforms, ensure the Device token is available before making any FCM plugin API calls
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      // Device token is available, make FCM plugin API requests...
      log("TOKEN==>$token");
    }
  }
}
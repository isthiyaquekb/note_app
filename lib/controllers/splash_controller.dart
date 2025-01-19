import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/core/app_keys.dart';
import 'package:note_app/core/app_routes.dart';

class SplashController extends GetxController{

  final storageBox = GetStorage();

  RxBool logoStatus = false.obs;
  RxBool titleStatus = false.obs;
  RxBool animationStatus = false.obs;

  RxBool animate = false.obs;
  @override
  void onInit() {
    super.onInit();
    log("STORAGE BOX===>${storageBox.read(AppKeys.keyIsLogged)}");
    storageBox.writeIfNull(AppKeys.keyIsLogged, false);
    startWaveAnimation();
    // requestPermission();
    getFCMToken();
  }

  Future startWaveAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value=true;
    await Future.delayed(const Duration(milliseconds: 3000));
    await _navigateToHome();
  }
  void requestPermission() async {
    NotificationSettings notificationSettings = await FirebaseMessaging.instance
        .requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      log("PERMISSION GRANTED");
      getFCMToken();

    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log("USER GRANTED PROVISIONAL PERMISSION");
    } else {
      log("USER PERMISSION DECLINED");
    }
  }
  void getFCMToken() async {
    // For apple platforms, ensure the Device token is available before making any FCM plugin API calls
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      // Device token is available, make FCM plugin API requests...
      log("TOKEN==>$token");
      storageBox.write(AppKeys.keyFCMToken, token);
    }else{
      log("TOKEN IS NULL==>$token");
    }
  }
  _navigateToHome() {
    storageBox.writeIfNull(AppKeys.keyIsLogged, false);
    log("GO TO HOME PAGE ${storageBox.read(AppKeys.keyIsLogged)}");
    storageBox.read(AppKeys.keyIsLogged)?Get.offAndToNamed(AppRoutes.dashboard):Get.offAndToNamed(AppRoutes.login);
  }
}
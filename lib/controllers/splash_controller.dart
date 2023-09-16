import 'dart:async';
import 'dart:developer';

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
    startWaveAnimation();
  }

  Future startWaveAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    animate.value=true;
    await Future.delayed(const Duration(milliseconds: 5000));
    await _navigateToHome();
  }

  _navigateToHome() {
    storageBox.writeIfNull(AppKeys.keyIsLogged, false);
    log("GO TO HOME PAGE ${storageBox.read(AppKeys.keyIsLogged)}");
    storageBox.read(AppKeys.keyIsLogged)?Get.offAndToNamed(AppRoutes.dashboard):Get.offAndToNamed(AppRoutes.login);
  }
}
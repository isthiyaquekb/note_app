import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/splash_controller.dart';
import 'package:note_app/core/app_assets.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/core/app_theme.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final splashController=Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.scaffoldDarkBackground,
      body: Stack(
        children: [
          Obx(() => AnimatedPositioned(
            duration: const Duration(
              milliseconds: 2500,
            ),
            curve: Curves.easeIn,
            bottom: 0,
            left: 0,
            right: splashController.animate.value ? 0 : -30,
            top: splashController.animate.value ? 0 : -120,
            child: AnimatedOpacity(opacity: splashController.animate.value ? 1 : 0,duration: const Duration(milliseconds: 1500),
            child: Image(image: const AssetImage(AppAssets.appLogo),height: MediaQuery.of(context).size.width*0.6,width: MediaQuery.of(context).size.width*0.6,)),
          ),),
          Obx(() => AnimatedPositioned(
            duration: const Duration(
              milliseconds: 2500,
            ),
            curve: Curves.easeIn,
            bottom: splashController.animate.value ? 0 : -280,
            left: 0,
            right: 0,
            top: splashController.animate.value ? MediaQuery.of(context).size.height*0.5 : -80,
            child: Center(
              child: Text(
                "Note App",
                style: AppTheme.darkTheme.textTheme.displayLarge,
              ),
            ),
          ),)

        ],
      )
    );
  }
}

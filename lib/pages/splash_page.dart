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
          AnimatedPositioned(
            duration: const Duration(
              milliseconds: 2500,
            ),
            curve: Curves.easeIn,
            bottom: 0,
            left: 0,
            right: splashController.animate.value ? 100 : -200,
            top: 0,
            child: Column(
              children: [
                Image(image: const AssetImage(AppAssets.appLogo),height: MediaQuery.of(context).size.width*0.3,width: MediaQuery.of(context).size.width*0.3,),
                Center(
                  child: Text(
                    "Note App",
                    style: AppTheme.darkTheme.textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}

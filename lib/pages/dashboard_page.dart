import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/dashboard_controller.dart';
import 'package:note_app/core/app_assets.dart';
import 'package:note_app/core/app_color.dart';
import 'package:note_app/pages/add_page.dart';
import 'package:note_app/pages/history_page.dart';
import 'package:note_app/pages/home_page.dart';
import 'package:note_app/pages/notification_page.dart';
import 'package:note_app/pages/setting_page.dart';
import 'package:note_app/widgets/custom_animated_bottom_bar.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GetBuilder<DashboardController>(builder: (dashboardController)=>CustomAnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: AppColor.scaffoldDarkBackground,
          selectedIndex: dashboardController.selectedTabIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: dashboardController.changeTabIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: SvgPicture.asset(
                AppAssets.homeIcon,
                height: 24,width: 24,
                color: dashboardController.selectedTabIndex == 0
                    ? AppColor.bottomNavBarColor
                    : AppColor.white,
              ),
              title: const Text('Home'),
              activeColor: AppColor.bottomNavBarColor,
              inactiveColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset(
                AppAssets.calenderIcon,
                height: 24,width: 24,
                color: dashboardController.selectedTabIndex == 1
                    ? AppColor.bottomNavBarColor
                    : AppColor.white,
              ),
              title: const Text('Past'),
              activeColor: AppColor.bottomNavBarColor,
              inactiveColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset(
                AppAssets.add,
                height: 24,width: 24,
                color: dashboardController.selectedTabIndex == 2
                    ? AppColor.bottomNavBarColor
                    : AppColor.white,
              ),
              title: const Text('Add '),
              activeColor: AppColor.bottomNavBarColor,
              inactiveColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset(
                AppAssets.bellIcon,
                height: 24,width: 24,
                color: dashboardController.selectedTabIndex == 3
                    ? AppColor.bottomNavBarColor
                    : AppColor.white,
              ),
              title: const Text('Notification '),
              activeColor: AppColor.bottomNavBarColor,
              inactiveColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: SvgPicture.asset(
                AppAssets.settingIcon,
                height: 24,width: 24,
                color: dashboardController.selectedTabIndex == 4
                    ? AppColor.bottomNavBarColor
                    : AppColor.white,
              ),
              title: const Text('Settings'),
              activeColor: AppColor.bottomNavBarColor,
              inactiveColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
          ],
        )),
        body: GetBuilder<DashboardController>(
            builder: (dashboardController) => IndexedStack(
                  index: dashboardController.selectedTabIndex,
                  children: [
                    const HomePage(),
                    HistoryPage(),
                    AddPage(),
                    const NotificationPage(),
                    const SettingPage()
                  ],
                )));
  }
}

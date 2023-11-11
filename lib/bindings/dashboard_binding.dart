import 'package:get/get.dart';
import 'package:note_app/controllers/addController.dart';
import 'package:note_app/controllers/dashboard_controller.dart';
import 'package:note_app/controllers/history_controller.dart';
import 'package:note_app/controllers/home_controller.dart';
import 'package:note_app/controllers/notification_controller.dart';

class DashboardBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(AddController());
    Get.put(HistoryController());
    Get.put(NotificationController());
  }

}
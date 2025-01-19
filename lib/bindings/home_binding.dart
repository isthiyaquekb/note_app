import 'package:get/get.dart';
import 'package:note_app/controllers/auth_controller.dart';
import 'package:note_app/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}
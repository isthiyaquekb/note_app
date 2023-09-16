import 'package:get/get.dart';
import 'package:note_app/controllers/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}
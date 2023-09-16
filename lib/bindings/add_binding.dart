import 'package:get/get.dart';
import 'package:note_app/controllers/addController.dart';

class AddBinding extends Bindings{

  @override
  void dependencies() {
   Get.put(AddController());
  }

}
import 'package:get/get.dart';
import 'package:note_app/controllers/history_controller.dart';

class HistoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HistoryController());
  }

}
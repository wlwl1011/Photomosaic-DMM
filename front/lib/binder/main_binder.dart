import 'package:get/get.dart';
import 'package:front/controller/main_controller.dart';

class MainPageBinder implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}

import 'package:get/get.dart';
import 'package:test/app/modules/second/controllers/second_controller.dart';

class SecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SecondController());
  }
}

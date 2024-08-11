import 'package:get/get.dart';

import '../controller/third_controller.dart';

class ThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThirdController());
  }
}
